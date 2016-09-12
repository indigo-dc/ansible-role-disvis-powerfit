[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![](https://images.microbadger.com/badges/image/indigodatacloudapps/powerfit.svg)](http://microbadger.com/images/indigodatacloudapps/powerfit "Get your own image badge on microbadger.com")

docker-powerfit
===============

Dockerfile to run powerfit on CPUs or GPUs

Introduction
------------

The image is built from the ansible-role of the following github repository:
* https://github.com/indigo-dc/ansible-role-disvis-powerfit

Dependencies: Base image
------------------------

The base image is now one that has the nvidia driver.

* https://hub.docker.com/r/lipcomputing/nvidia-ubuntu16.04/

The NVIDIA driver version of the image has to match the one on the physical
machine. The ansible-role repository shows the version with which the current
image is built. The details maybe found in:

* https://github.com/LIP-Computing/ansible-role-nvidia

The ansible-role has a variable which is the NVDIDIA driver, as such if you
have a different version you will have to can run the ansible-role specifying
the correct version.

Build docker image
------------------

The image can be built with
```
docker build -t powerfit .
```

Or you can pull it from the dockerhub:
```
docker pull indigodatacloudapps/powerfit
```

Run docker-powerfit
-------------------

The docker containes the opencl application hosted in:
* https://github.com/haddocking/powerfit

Read section "Options" for examples to run the application. 
To run the powerfit in CPUs, you can instantiate the container:

```
$ docker run -it indigodatacloudapps/powerfit /bin/bash
# cd /home
# ./run-powerfitCPU.sh
```

To run the powerfit in GPU, you can instantiate the container and import the
NVIDIA devices:

```
$ docker run \
    --device=/dev/nvidia0:/dev/nvidia0 \
    --device=/dev/nvidiactl:/dev/nvidiactl \
    --device=/dev/nvidia-uvm:/dev/nvidia-uvm \
    -it \
    indigodatacloudapps/powerfit /bin/bash
# cd /home
# ./run-powerfitGPU.sh
```

License
-------

Apache v2

Author Information
------------------

Mario David: <mariojmdavid@gmail.com>

LIP Lisbon: http://www.lip.pt

Indigo DataCloud: https://www.indigo-datacloud.eu/

Acknowledgments
---------------

* https://github.com/haddocking/powerfit.git

