This is Ubuntu 14.04 x86_64 LTS with Cuda 6.5 installed.


1) Make sure the driver version of host is 34.29. This is the one coming with CUDA 6.5.14.
---
The host must have the same version of Cuda driver installed. The image uses NVIDIA-Linux-x86_64-340.29 now. You can download this driver from http://www.nvidia.com/Download/index.aspx.

How to get my current Cuda driver version? Use:

    nvidia-smi

2) Launch the container with GPU enabled.
----
 (Special thanks to 
Traun Leyden	for pointing out the way to run CUDA images without starting docker in LXC mode.)

    DOCKER_NVIDIA_DEVICES="--device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm"

    docker run -ti $DOCKER_NVIDIA_DEVICES hjk41/ubuntu_14.04_with_cuda /bin/bash
  If you have multiple GPU that you want to use in docker, you will need to modify the DOCKER_NVIDIA_DEVICES line and add more devices such as "--device /dev/nvidia1:/dev/nvidia1".


*Any questions or suggestions, contact me at chuntao.hong (at) gmail.com*
