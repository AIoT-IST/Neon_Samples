/*
 * Copyright (c) 2019, ADLINK Technology. All rights reserved.
 *
 */

#ifndef __INDUSTRY_CAMERA_H__
#define __INDUSTRY_CAMERA_H__

#include <string>
#include <thread>

// Include files to use the PYLON API.
#include <pylon/PylonIncludes.h>
// Namespace for using pylon objects.
using namespace Pylon;

// Settings for using Basler USB cameras.
#include <pylon/usb/BaslerUsbInstantCamera.h>
typedef Pylon::CBaslerUsbInstantCamera Camera_t;

class QWaitCondition;
class QMutex;

class indCamera
{
public:
	// Create camera
	static indCamera* Create( int CameraType=0 );
	static indCamera* Create( uint32_t width, uint32_t height, int CameraType=0 );
	
	// Constructor & Destroy
	indCamera();
	~indCamera();

	// Start/stop streaming
	bool Open();
	void Close();
	
	// Capture YUV (NV12)
	bool Capture( void** cpu, void** cuda, unsigned long timeout=ULONG_MAX );
	
	// Takes in captured YUV-NV12 CUDA image, converts to float4 RGBA (with pixel intensity 0-255)
	// Set zeroCopy to true if you need to access ConvertRGBA from CPU, otherwise it will be CUDA only.
	bool ConvertRGBA( void* input, void** output, bool zeroCopy=false );
	
	void checkBuffer();
  
	// Image dimensions
	inline uint32_t GetWidth() const	  { return mWidth; }
	inline uint32_t GetHeight() const	  { return mHeight; }
	inline uint32_t GetPixelDepth() const { return mDepth; }
	inline uint32_t GetSize() const		  { return mSize; }
	
	// Default resolution, unless otherwise specified during Create()
	static const uint32_t DefaultWidth  = 1600;
	static const uint32_t DefaultHeight = 1200;

	void RetrieveResultThread(void);

	void* mGrabbedImgBuffer;
	Camera_t* mpCamera;
	std::thread* m_pThread;
  
private:
	bool init();
  
	uint32_t mWidth;
	uint32_t mHeight;
	uint32_t mDepth;
	uint32_t mSize;
	
	static const uint32_t NUM_RINGBUFFERS = 16;
	
	void* mRingbufferCPU[NUM_RINGBUFFERS];
	void* mRingbufferGPU[NUM_RINGBUFFERS];
	
	QWaitCondition* mWaitEvent;
	
	QMutex* mWaitMutex;
	QMutex* mRingMutex;
	
	uint32_t mLatestRGBA;
	uint32_t mLatestRingbuffer;
	bool     mLatestRetrieved;
	
	void* mRGBA[NUM_RINGBUFFERS];
	int   mCameraType;
};

#endif
