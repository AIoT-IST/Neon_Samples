# 📷 ADLINK Neon-ONO + Euresys DeepOCR Sample Guide

This guide demonstrates how to run a real-time OCR application on the ADLINK Neon-ONO smart camera using Euresys EasyDeepOCR. The application displays a live preview from the camera, allows ROI selection by mouse, and shows OCR results and inference time in real time.

---

## 🧩 Installation Steps (Run Once Only)

### 1. Install Dependencies
```bash
sudo apt install g++-10 -y
sudo apt install libdbus-1-3 libdrm2 libegl1 libfontconfig1 libfreetype6 libglx0 libinput10 \
libopengl0 libwayland-client0 libwayland-cursor0 libwayland-egl1 libwayland-server0 libx11-6 \
libx11-xcb1 libxcb-cursor0 libxcb-glx0 libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-randr0 \
libxcb-render-util0 libxcb-render0 libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 \
libxcb-xkb1 libxkbcommon-x11-0 libxkbcommon0 libxcb-xinerama0 -y
```

### 2. Install Euresys Packages
```bash
sudo apt install ./neo-linux-license-manager-arm64-*.deb \
                 ./codemeter-lite_*.deb \
                 ./open_evision-linux-arm64-*.deb -y
```

### 3. Install Deep Learning Redistributable
```bash
mkdir redist
tar -zxvf open_evision-deep-learning-redist-linux-arm64-*.tar.gz -C redist
cd redist
sudo apt install ./open_evision-deep-learning-redist-linux-arm64-*.deb -y
```

### 4. Set Environment Variables
Append the following to your `~/.bashrc` and run `source ~/.bashrc`:
```bash
export GENICAM_GENTL64_PATH=/opt/euresys/egrabber/lib/aarch64
export EURESYS_EGRABBER_LIB64=/opt/euresys/egrabber/lib/aarch64
export EURESYS_DEFAULT_GENTL_PRODUCER=playlink
export CUDA_CACHE_MAXSIZE=2147483648
```

### 5. Install Python 3.11 and Required Packages
```bash
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.11 python3.11-venv -y

python3.11 -m ensurepip --upgrade
python3.11 -m pip install --upgrade pip
python3.11 -m pip install open_evision-25.2.1+34382-py3-none-linux_aarch64.whl
```

### 6. Install Pylon and GStreamer Plugin
```bash
cd ~/Downloads
wget https://github.com/basler/gst-plugin-pylon/releases/download/v1.0.0/gst-plugin-pylon_1.0.0-1.ubuntu-20.04_arm64.deb
wget https://sftp.adlinktech.com/image/pylon/pylon-7.5.0.15658-linux-aarch64_debs.tar.gz

mkdir pylon && tar -zxvf pylon-7.5.0.15658-linux-aarch64_debs.tar.gz -C pylon
cd pylon && sudo dpkg -i pylon_7.5.0.15658-deb0_arm64.deb

cd ~/Downloads
sudo dpkg -i gst-plugin-pylon_1.0.0-1.ubuntu-20.04_arm64.deb
sudo rm -rf ~/.cache/gstreamer-1.0/
gst-inspect-1.0 pylonsrc
```

---

## ▶️ Running the Sample Program

### 1. Place `OCR_preview.py` in the `~/Downloads` directory.

### 2. (Optional) Modify to use CPU for faster startup:
```python
# Use CPU instead of GPU (in OCR_preview.py)
ocr_settings.Engine = "default"
ocr_settings.DeviceByName = "CPU"
```

### 3. Run the script:
```bash
cd ~/Downloads
python3.11 OCR_preview.py
```

---

## 🖱️ How to Use

1. A live stream from the Basler camera will be shown.
2. Use your mouse to draw a rectangle (ROI) on the screen.
3. The OCR will process the ROI and display detected text and inference time.

---

## 🧠 Notes

- Default GPU (TensorRT) inference initialization can take ~21 minutes. Use CPU mode for quicker startup.
- Ensure the camera is connected and detected before running.

## 🔐 Licensing Requirement

To run this sample, a valid Euresys license is required. Please ensure you have one of the following combinations:

- **Neo Dongle (ID: 6514)** with **EasyDeepOCR License (ID: 4341)**
- **USB Dongle (ID: 6512)** with **EasyDeepOCR License (ID: 4191)**

Without a valid license, the OCR functionality will not be available.

---

<video width="640" height="360" controls>
  <source src="demo.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>
