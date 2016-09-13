[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![](https://images.microbadger.com/badges/image/indigodatacloudapps/disvis.svg)](http://microbadger.com/images/indigodatacloudapps/disvis "Get your own image badge on microbadger.com")

docker-disvis
=============

Dockerfile to run disvis on CPUs or GPUs


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

The NVIDIA driver version is tagged in the docker image as follows

* TAG = nvdrv_352.93 : nvidia driver version 352.93
* TAG = nvdrv_352.99 : nvidia driver version 352.99


Build docker image
------------------

The image can be built with
```
docker build -t disvis .
```

Or you can pull it from the dockerhub:
```
docker pull indigodatacloudapps/disvis
```

Run docker-disvis
-----------------

The docker containes the opencl application hosted in:
* https://github.com/haddocking/disvis

Read section "Options" for examples to run the application. 
The example below uses the files
* O14250.pdb
* Q9UT97.pdb
* restraints.dat

To run the disvis in CPUs, you can instantiate the container:

```
$ docker run -it indigodatacloudapps/disvis /bin/bash
# cd /home
# mkdir out
# export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
# export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
# disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -p 2 -a 20.0 -vs 2 -d /home/out
```

To run the disvis in GPU, you can instantiate the container and import the
NVIDIA devices:

```
$ docker run \
    --device=/dev/nvidia0:/dev/nvidia0 \
    --device=/dev/nvidiactl:/dev/nvidiactl \
    --device=/dev/nvidia-uvm:/dev/nvidia-uvm \
    -it \
    indigodatacloudapps/disvis /bin/bash
# cd /home
# mkdir out
# export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
# export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
# disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -g -a 20.0 -vs 2 -d /home/out
```

License
-------

Apache v2

Author Information
------------------

Mario David: mariojmdavid@gmail.com
LIP and Indigo-DataCloud project

Acknowledgments
---------------

* https://github.com/haddocking/disvis.git

