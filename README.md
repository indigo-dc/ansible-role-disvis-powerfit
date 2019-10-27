[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/indigo-dc/ansible-role-disvis-powerfit.svg?branch=master)](https://travis-ci.org/indigo-dc/ansible-role-disvis-powerfit)

# Dockerfile for disvis and powerfit application

### **Deprecation notice**:
The Ansible role is no longer maintained. This repository will
be used only for the Dockerfiles of Disvis and Powerfit where the dockerhub repository
points to. The README will refer exclusively to the docker images.

## Introduction

Dockerfiles to install the disvis or powerfit application:

* https://github.com/haddocking/disvis.git
* https://github.com/haddocking/powerfit.git

The directories `dockers/docker-disvis` and `dockers/docker-powerfit`
are linked to dockerhub with automatic build of those 2 images. These images can run
disvis or powerfit either in CPUs, or in GPUs.

## Run the disvis application

Download example input files, in your browser goto:

* https://nc.ncg.ingrid.pt/index.php/s/4HTNxMQRoCyfEPk

You will get a tarball `haddock-input.tgz`:

    tar zxvf haddock-input.tgz

The example runs disvis on the CPU with 2 threads:

    $ cd /home
    $ mkdir out
    $ export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
    $ export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
    $ disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -p 2 -a 20.0 -vs 2 -d /home/out

To run in the GPU:

    $ cd /home
    $ mkdir out
    $ export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
    $ export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
    $ disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -g -a 20.0 -vs 2 -d /home/out

## Run the powerfit application

The example runs powerfit on the CPU with 2 threads:

    $ cd /home
    $ ./run-powerfitCPU.sh

To run in the GPU:

    $ cd /home
    $ ./run-powerfitGPU.sh

## License

Apache v2

## Author Information

* Mario David: <mariojmdavid@gmail.com>
* LIP Lisbon: http://www.lip.pt
* Indigo DataCloud: https://www.indigo-datacloud.eu/

## Acknowledgments

* https://github.com/haddocking/disvis.git
* https://github.com/haddocking/powerfit.git
