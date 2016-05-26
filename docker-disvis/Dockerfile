# docker build -t disvis .

FROM indigodatacloud/ubuntu-sshd:14.04
MAINTAINER Mario David <mariojmdavid@gmail.com>

RUN ansible-galaxy install indigo-dc.disvis-powerfit && \
    ansible-playbook /etc/ansible/roles/indigo-dc.disvis-powerfit/tests/disvis.yml

ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/local/lib64
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
