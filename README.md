# Sample version v1.0.0
# Capture and Inference python sample code of Neon series 
## Prerequisites:
  **Note: Neon-2000-JNX preinstall following packages by default.**
  - Install pypylon
  ```
    sudo apt-get update
    sudo apt-get install python3-pip -y
    python3 -m pip install --upgrade pip
    pip3 install pypylon
  ```
  - Install Pylon SDK 5.2.0 from https://www.baslerweb.com/en/sales-support/downloads/software-downloads/# 
  - Install jetson Python module from https://github.com/dusty-nv/jetson-inference
  
## Run Sample
### Neon-20xB camera
#### Pre-build requirement 
1. install necessary libary (need Internet)
sudo apt-get install cmake qt{4,5}-qmake libqt4-dev libglew-dev dialog

2. Add libnvidia
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/pylon5/lib64:/usr/lib/aarch64-linux-gnu/

-  C++
    - Build Sample
	  ```
	    cd [Sample Path]/Neon_Samples/Neon-20xB/C++/Capture_and_Inference
	    rm -rf build
	    mkdir build
        cd build
	    cmake ..
	    make -j$(nproc)
	  ```
    - Capture and Inference
	  ```
	    cd [Sample Path]/Neon_Samples/Neon-20xB/C++/Capture_and_Inference/build
	    ./aarch64/bin/imagenet-camera [input_width] [input_height]
	  ```
      For example, resolution of camera is 1920x1080, please tpye:
        ```
          cd [Sample Path]/Neon_Samples/Neon-20xB/C++/Capture_and_Inference/build
          ./aarch64/bin/imagenet-camera 1920 1080
        ```
        ```
        ./aarch64/bin/imagenet-console [input_image] [output_image]
        ```
      For example, input image you want to classfy, please tpye:
        ```
          cd [Sample Path]/Neon_Samples/Neon-20xB/C++/Capture_and_Inference/build
          ./aarch64/bin/imagenet-console ./aarch64/bin/jellyfish.jpg ./aarch64/bin/output.jpg
        ```    
- Python
  - Preview
  ```
    cd [Sample Path]/Neon_Samples/Neon-20xB/Python/Capture
    ./Capture-basler.py
  ```
  - Grab one image

  ```
    cd [Sample Path]/Neon_Samples/Neon-20xB/Python/Capture
    ./OneShot-basler.py
  ```
  - Inference

  ```
    cd [Sample Path]/Neon_Samples/Neon-20xB/Python/Inference
    ./detectnet-basler.py
  ```

### Neon-20xA camera
- Python
  - Preview by Opencv
  ```
    cd [Sample Path]/Neon_Samples/Neon-20xA/Python/Capture
    ./Capture-appropho.py
  ```
  - Capture and Inference
    ```
    cd [Sample Path]/Neon_Samples/Neon-20xA/Python/Inference
    ./detectnet-appropho.py
  ```
