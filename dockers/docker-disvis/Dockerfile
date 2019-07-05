# docker build -t disvis .

FROM nvidia/opencl:devel
MAINTAINER Mario David <mariojmdavid@gmail.com>
LABEL description="Run Disvis application"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc git python-dev python-pip wget tar \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && cd /home \
    && pip install setuptools \
    && pip install cython numpy pyopencl \
    && git clone https://github.com/geggo/gpyfft.git \
    && git clone https://github.com/haddocking/disvis.git

#    && cd disvis \
#    && python setup.py install
