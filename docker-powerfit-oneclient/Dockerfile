# docker build --rm -t powerfit-oneclient .

FROM lipcomputing/nvidia-ubuntu16.04
MAINTAINER Mario David <mariojmdavid@gmail.com>
LABEL description="Run Powerfit application"

RUN ansible-galaxy install indigo-dc.oneclient indigo-dc.disvis-powerfit && \
    ansible-playbook /etc/ansible/roles/indigo-dc.oneclient/tests/test.yml && \
    ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/powerfit.yml

EXPOSE 22
CMD    /etc/init.d/vmcontext start; /usr/sbin/sshd -D
