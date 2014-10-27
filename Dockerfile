FROM ubuntu:14.04
MAINTAINER hjk41

RUN apt-get update \
	&& apt-get install -y wget

RUN mkdir -p /tmp/nvidia \
	&& cd /tmp/nvidia \
	&& wget http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run \
	&& chmod +x cuda_6.5.14_linux_64.run \
	&& mkdir /tmp/nvidia/extracted \
	&& /tmp/nvidia/cuda_6.5.14_linux_64.run --extract=/tmp/nvidia/extracted

RUN apt-get update \
	&& apt-get install -y build-essential \
	&& apt-get --purge remove -y nvidia*

RUN /tmp/nvidia/extracted/NVIDIA-Linux-x86_64-*.run -s -N --no-kernel-module
RUN /tmp/nvidia/extracted/cuda-linux64-rel-6.5.14-*.run -toolkit -silent
RUN echo "/usr/local/cuda/lib64" > /etc/ld.so.conf.d/cuda.conf                                     
RUN echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64" >> ~/.bashrc
RUN rm -rf /temp/*  
RUN rm -rf /tmp/nvidia
