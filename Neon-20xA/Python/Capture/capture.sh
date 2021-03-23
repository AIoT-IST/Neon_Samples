sudo nvpmodel -m 0&
sleep 1
sudo jetson_clocks&
v4l2-ctl -d /dev/video0 --set-ctrl=ae_max_shutter=5&
v4l2-ctl -d /dev/video0 --set-parm=60&
gst-launch-1.0 nvv4l2camerasrc device=/dev/video0 ! 'video/x-raw(memory:NVMM), width=1920, height=1080, framerate=60/1, format=UYVY' ! nvvidconv ! 'video/x-raw, width=(int)1920, height=(int)1080' ! fpsdisplaysink video-sink=xvimagesink sync=false&
