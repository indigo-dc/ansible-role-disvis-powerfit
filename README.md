Role for disvis application
===========================

A test role to install the disvis or powerfit application from:

* https://github.com/haddocking/disvis.git
* https://github.com/haddocking/powerfit.git

The application can be chosen from a role variable.

Requirements
------------

No aditional requirements

Role Variables
--------------

The variables that can be passed to this role and a brief description
about them are as follows.

1. NVIDIA driver version
   * nvidia_driver_version: Default = 352.93
2. Haddocking application: <disvis | powerfit>
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
$ ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/test-disvis.yml
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
$ ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/test-powerfit.yml
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

To run in the GPU

```
$ cd /home
$ mkdir out
$ export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:/usr/local/lib64
$ export EX_DIR=/usr/local/disvis/test-cases/PRE5-PUP2-complex
$ disvis ${EX_DIR}/O14250.pdb ${EX_DIR}/Q9UT97.pdb ${EX_DIR}/restraints.dat -g -a 20.0 -vs 2 -d /home/out
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
* https://github.com/haddocking/powerfit.git
