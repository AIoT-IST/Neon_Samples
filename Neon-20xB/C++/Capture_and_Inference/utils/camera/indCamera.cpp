/*
 * Copyright (c) 2019, ADLINK Technology. All rights reserved.
 *
 */

#include "indCamera.h"

#include <sstream> 
#include <unistd.h>
#include <string.h>
#include <thread>

#include <QMutex>
#include <QWaitCondition>

#include "cudaMappedMemory.h"
#include "cudaYUV.h"
#include "cudaRGB.h"

#include "tensorNet.h"

// Include files to use the PYLON API.
#include <pylon/PylonIncludes.h>
// Namespace for using pylon objects.
using namespace Pylon;

// Settings for using Basler USB cameras.
#include <pylon/usb/BaslerUsbInstantCamera.h>
typedef Pylon::CBaslerUsbInstantCamera Camera_t;
typedef Pylon::CBaslerUsbCameraEventHandler CameraEventHandler_t; // Or use Camera_t::CameraEventHandler_t
typedef Pylon::CBaslerUsbImageEventHandler ImageEventHandler_t; // Or use Camera_t::ImageEventHandler_t
typedef Pylon::CBaslerUsbGrabResultPtr GrabResultPtr_t; // Or use Camera_t::GrabResultPtr_t
using namespace Basler_UsbCameraParams;


// Namespace for using cout.
using namespace std;

indCamera* g_pIndCamera;

//Image event handler.
class CEventHandler : public CameraEventHandler_t, public ImageEventHandler_t
{
public:
    // constructor
    CEventHandler()
    {
        //printf("[Camera] CEventHandler constructor \n");
    }

    // destructor
    ~CEventHandler()
    {
        //printf("[Camera] CEventHandler destructor \n");
    }

    // This method is called when an image has been grabbed.
    virtual void OnImageGrabbed( Camera_t& camera, const GrabResultPtr_t& ptrGrabResult)
    {
        cout << "[Camera] OnImageGrabbed frame number: " << (uint16_t)ptrGrabResult->GetBlockID() << std::endl;

        size_t strideByte;
        ptrGrabResult->GetStride(strideByte);

        cout << "[Camera] Width " << ptrGrabResult->GetWidth() 
             << ", Height " << ptrGrabResult->GetHeight()
             << ", Size " << ptrGrabResult->GetImageSize()
             << ", PixelType " << ptrGrabResult->GetPixelType()
             << ", Stride " << strideByte  << std::endl;

        g_pIndCamera->mGrabbedImgBuffer = ptrGrabResult->GetBuffer();
        g_pIndCamera->checkBuffer();
    }

    virtual void OnImageEventHandlerRegistered( Camera_t& camera)
    {
        printf("[Camera] Image event handler registered\n");
    }
};

CEventHandler *g_pEventHandler;


// constructor
indCamera::indCamera()
{	
	mCameraType = -1;
	
	mWidth  = 0;
	mHeight = 0;
	mDepth  = 0;
	mSize   = 0;
	
	mWaitEvent  = new QWaitCondition();
	mWaitMutex  = new QMutex();
	mRingMutex  = new QMutex();
	
	mLatestRGBA       = 0;
	mLatestRingbuffer = 0;
	mLatestRetrieved  = true;  // original: false
	
	for( uint32_t n=0; n < NUM_RINGBUFFERS; n++ )
	{
		mRingbufferCPU[n] = NULL;
		mRingbufferGPU[n] = NULL;
		mRGBA[n]          = NULL;
	}
  
  g_pIndCamera = (indCamera*)this;
  g_pEventHandler = NULL;
  
  mpCamera = NULL;
  mGrabbedImgBuffer = NULL;
  m_pThread = NULL;
  
  // Before using any pylon methods, the pylon runtime must be initialized. 
  PylonInitialize();
}


// destructor
indCamera::~indCamera()
{
  Close();
  
  if (g_pEventHandler)
    delete g_pEventHandler;

  if (mpCamera)
    delete mpCamera;

  // Releases all pylon resources. 
  PylonTerminate(); 
}


// ConvertRGBA
bool indCamera::ConvertRGBA( void* input, void** output, bool zeroCopy )
{
	if( !input || !output )
		return false;
	
	if( !mRGBA[0] )
	{
		const size_t size = mWidth * mHeight * sizeof(float4);

		for( uint32_t n=0; n < NUM_RINGBUFFERS; n++ )
		{
			if( zeroCopy )
			{
				void* cpuPtr = NULL;
				void* gpuPtr = NULL;

				if( !cudaAllocMapped(&cpuPtr, &gpuPtr, size) )
				{
					printf(LOG_CUDA "indCamera -- failed to allocate zeroCopy memory for %ux%xu RGBA texture\n", mWidth, mHeight);
					return false;
				}

				if( cpuPtr != gpuPtr )
				{
					printf(LOG_CUDA "indCamera -- zeroCopy memory has different pointers, please use a UVA-compatible GPU\n");
					return false;
				}

				mRGBA[n] = gpuPtr;
			}
			else
			{
				if( CUDA_FAILED(cudaMalloc(&mRGBA[n], size)) )
				{
					printf(LOG_CUDA "indCamera -- failed to allocate memory for %ux%u RGBA texture\n", mWidth, mHeight);
					return false;
				}
			}
		}
		
		printf(LOG_CUDA "industry camera -- allocated %u RGBA ringbuffers\n", NUM_RINGBUFFERS);
	}
	
	// USB webcam is RGB
	//if( CUDA_FAILED(cudaRGBToRGBAf((uchar3*)input, (float4*)mRGBA[mLatestRGBA], mWidth, mHeight)) )
	if( CUDA_FAILED(cudaRGB8ToRGBA32((uchar3*)input, (float4*)mRGBA[mLatestRGBA], mWidth, mHeight)) )
	//if( CUDA_FAILED(cudaYUYVToRGBA((uchar2*)input, (float4*)mRGBA[mLatestRGBA], mWidth, mHeight)) )
		return false;
		
	*output     = mRGBA[mLatestRGBA];
	mLatestRGBA = (mLatestRGBA + 1) % NUM_RINGBUFFERS;
	return true;
}
	

// Capture
bool indCamera::Capture( void** cpu, void** cuda, unsigned long timeout )
{
	mWaitMutex->lock();
	const bool wait_result = mWaitEvent->wait(mWaitMutex, timeout);
	mWaitMutex->unlock();
	
	if( !wait_result )
		return false;
	
	mRingMutex->lock();
	const uint32_t latest = mLatestRingbuffer;
	const bool retrieved = mLatestRetrieved;
	mLatestRetrieved = true;
	mRingMutex->unlock();
	
	// skip if it was already retrieved
	if( retrieved )
		return false;
	
	if( cpu != NULL )
		*cpu = mRingbufferCPU[latest];
	
	if( cuda != NULL )
		*cuda = mRingbufferGPU[latest];
	
	return true;
}


// checkBuffer
void indCamera::checkBuffer()
{
	cout << "[Camera] buffer address " << mGrabbedImgBuffer << std::endl;

	// make sure ringbuffer is allocated
	if( !mRingbufferCPU[0] )
	{
		for( uint32_t n=0; n < NUM_RINGBUFFERS; n++ )
		{
			if( !cudaAllocMapped(&mRingbufferCPU[n], &mRingbufferGPU[n], mSize) )
				printf(LOG_CUDA "industry camera -- failed to allocate ringbuffer %u  (size=%u)\n", n, mSize);
		}
		
		printf(LOG_CUDA "industry camera -- allocated %u ringbuffers, %u bytes each\n", NUM_RINGBUFFERS, mSize);
	}
	
	// copy to next ringbuffer
	const uint32_t nextRingbuffer = (mLatestRingbuffer + 1) % NUM_RINGBUFFERS;		
	memcpy(mRingbufferCPU[nextRingbuffer], mGrabbedImgBuffer, mSize);
	
	// update and signal sleeping threads
	mRingMutex->lock();
	mLatestRingbuffer = nextRingbuffer;
	mLatestRetrieved  = false;
	mRingMutex->unlock();
	mWaitEvent->wakeAll();
}


// Create
indCamera* indCamera::Create(int CameraType )
{
	return Create( DefaultWidth, DefaultHeight, CameraType );
}


// Create
indCamera* indCamera::Create( uint32_t width, uint32_t height, int CameraType )
{                      
	indCamera* cam = new indCamera();
	
	if( !cam )
		return NULL;

	if( !cam->init() )
	{
		printf("[Camera] failed to init indCamera\n");
		return NULL;
	}

	cam->mCameraType = CameraType;
	cam->mWidth      = width;
	cam->mHeight     = height;
	cam->mDepth      = 24;	// 16:YUYV 422, 24:RGB8
	cam->mSize       = (width * height * cam->mDepth) / 8;

        cout << "[***************] Width " << width
             << ", Height " << height
             << ", Size " << cam->mSize
             << ", mCameraType " << CameraType
             << std::endl;

	return cam;
}


// init
bool indCamera::init()
{
  try
  {
    // Only look for cameras supported by Camera_t
    CDeviceInfo info;
    info.SetDeviceClass( Camera_t::DeviceClass());

    // Create an instant camera object with the first found camera device matching the specified device class.
    mpCamera = new Camera_t(CTlFactory::GetInstance().CreateFirstDevice( info));
    if (!mpCamera->IsPylonDeviceAttached())
      return false;
    cout << "[Camera] Device model " << mpCamera->GetDeviceInfo().GetModelName()
         << ", s/n " << mpCamera->GetDeviceInfo().GetSerialNumber() << endl;

    // Register image event handler.
    g_pEventHandler = new CEventHandler;
    mpCamera->RegisterImageEventHandler(g_pEventHandler, RegistrationMode_Append, Cleanup_Delete);
    // Camera event processing must be activated first, the default is off.
    mpCamera->GrabCameraEvents = true;

    //mpCamera->MaxNumBuffer = 5;

    // Open the camera for setting parameters.
    mpCamera->Open();

    mpCamera->PixelFormat = PixelFormat_RGB8;
  }
  catch (const GenericException &e)
  {
    // Error handling.
    cerr << "An exception occurred." << endl
    << e.GetDescription() << endl;
    
    return false;
  }
  
  return true;
}


// Open
bool indCamera::Open()
{
  if (!mpCamera)
    return false;

  printf("[Camera] Start thread to retrieve grabbing result\n");
  m_pThread = new thread(&indCamera::RetrieveResultThread, this);

  return true;
}
	

// Close
void indCamera::Close()
{
  if (!mpCamera)
    return;

  // Stops the grabbing of images.
  mpCamera->StopGrabbing();  

  // Waiting for thread stop
  m_pThread->join();
  m_pThread = NULL;

  usleep(250*1000);
}


// Thread to retrieve grabbing result
void indCamera::RetrieveResultThread(void)
{
  CGrabResultPtr ptrGrabResult;

  try
  {
    // Starts the grabbing of images.
    mpCamera->StartGrabbing();

    while (mpCamera->IsGrabbing())
    {
      // Retrieve grab results and notify the camera event and image event handlers.
      mpCamera->RetrieveResult(5000, ptrGrabResult, TimeoutHandling_ThrowException);
    }
  }
  catch (const GenericException &e)
  {
    // Error handling.
    cerr << "An exception occurred." << endl
    << e.GetDescription() << endl;
  }
}



