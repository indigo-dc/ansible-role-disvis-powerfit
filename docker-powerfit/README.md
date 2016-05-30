docker-powerfit
===============

Dockerfile to run powerfit on CPUs or GPUs


Introduction
------------

The image is built from the ansible-role of the following github repository:
* https://github.com/indigo-dc/ansible-role-disvis-powerfit

The NVIDIA driver version of the image has to match the one on the physical
machine. The ansible-role repository shows the version with which the current
image is built.

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

THIS PART TO be completed

To run the powerfit in CPUs, you can instantiate the container:

```
$ docker run -it indigodatacloudapps/powerfit /bin/bash
#
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
#
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

* https://github.com/haddocking/powerfit.git

