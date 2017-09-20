#!/bin/bash

git clone https://github.com/indigo-dc/udocker
cd udocker
./udocker.py pull indigodatacloudapps/disvis:jenkins-preview

./udocker.py create --name=jenkins-preview indigodatacloudapps/disvis:jenkins-preview
cp -r input_files /tmp/.
mkdir /tmp/results
./udocker.py run -v /dev --volume=/tmp/:/home jenkins-preview disvis /home/input_files/fixed_chain.pdb /home/input_files/scanning_chain.pdb /home/input_files/restraints.txt -a 60.00 -vs 4.00 -d /home/results

./udocker.py rm jenkins-preview
./udocker.py rmi indigodatacloudapps/disvis:jenkins-preview
