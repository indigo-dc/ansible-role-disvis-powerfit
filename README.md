[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Build Status](https://travis-ci.org/indigo-dc/ansible-role-disvis-powerfit.svg?branch=master)](https://travis-ci.org/indigo-dc/ansible-role-disvis-powerfit)

Role and Dockerfile for disvis and powerfit application
=======================================================

Roles and Dockerfiles to install the disvis or powerfit application:

* https://github.com/haddocking/disvis.git
* https://github.com/haddocking/powerfit.git

The application can be chosen from a role variable.

Introduction
------------

The repository contains ansible-roles that are published in
ansible galaxy: https://galaxy.ansible.com/indigo-dc/disvis-powerfit/

The directories docker-disvis and docker-powerfit are linked to
dockerhub with automatic build of those 2 images. These images can run
disvis or powerfit either in CPUs, or in GPUs, the NVIDIA driver version
is show below in the the ansible-role default variable
*nvidia_driver_version*

Requirements
------------

No aditional requirements

Role Variables
--------------

The variables that can be passed to this role and a brief description
about them are as follows.

1. NVIDIA driver version
   * nvidia_driver_version: Default = 352.93
2. Haddocking application: disvis or powerfit
   * haddock_app: Default = disvis
3. Variables related to NVIDIA url and executable
   * base_url: Default = http://us.download.nvidia.com/XFree86/Linux-x86_64
   * nvidia_driver: Default = NVIDIA-Linux-x86_64-{{ nvidia_driver_version }}.run
   * nvidia_url: Default = {{ base_url }}/{{ nvidia_driver_version }}/{{ nvidia_driver }}
4. URL with opencl headers
   * opencl_url: Default = http://www.lip.pt/~david/cl_include.tgz

Dependencies
------------

None for now

Install the Playbook
--------------------

To install the role:

```
$ ansible-galaxy install indigo-dc.disvis-powerfit
```

Run the playbook
----------------

An example of playbook for the disvis:

```
---
- hosts: localhost
  roles:
    - { role: indigo-dc.disvis-powerfit haddock_app: disvis }
```

Or execute:

```
$ ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/disvis.yml
```

An example of playbook for the powerfit:

```
---
- hosts: localhost
  roles:
    - { role: indigo-dc.disvis-powerfit, haddock_app: powerfit }
```

Or execute:

```
$ ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/powerfit.yml
```

Run the disvis application
--------------------------

The example runs disvis on the CPU with 2 threads:

```
$ cd /home
$ mkdir out
$ export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
$ export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
$ disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -p 2 -a 20.0 -vs 2 -d /home/out
```

To run in the GPU:

```
$ cd /home
$ mkdir out
$ export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
$ export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
$ disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -g -a 20.0 -vs 2 -d /home/out
```

Run the powerfit application
----------------------------

The example runs powerfit on the CPU with 2 threads:

```
$ cd /home
$ ./run-powerfitCPU.sh
```

To run in the GPU:

```
$ cd /home
$ ./run-powerfitGPU.sh
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

* https://github.com/haddocking/disvis.git
* https://github.com/haddocking/powerfit.git
