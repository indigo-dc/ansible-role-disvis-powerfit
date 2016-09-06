# docker build --rm -t powerfit .

FROM indigodatacloud/ubuntu-sshd:14.04
MAINTAINER Mario David <mariojmdavid@gmail.com>
LABEL description="Run Powerfit application"

RUN ansible-galaxy install indigo-dc.disvis-powerfit && \
    ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/powerfit.yml

ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/lib64
EXPOSE 22
CMD /etc/init.d/vmcontext start; /usr/sbin/sshd -D
