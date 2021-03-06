#!/bin/bash

export CUDA_VER=8.0.61-1

travis_retry wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_${CUDA_VER}_amd64.deb
travis_retry sudo dpkg -i cuda-repo-ubuntu1404_${CUDA_VER}_amd64.deb
travis_retry sudo apt-get update -qq
export CUDA_APT=${CUDA_VER:0:3}
export CUDA_APT=${CUDA_APT/./-}
travis_retry sudo apt-get install -y cuda-drivers cuda-core-${CUDA_APT} cuda-cudart-dev-${CUDA_APT} cuda-cufft-dev-${CUDA_APT}
travis_retry sudo apt-get clean
export CUDA_HOME=/usr/local/cuda-${CUDA_VER:0:3}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
export PATH=${CUDA_HOME}/bin:${PATH}
