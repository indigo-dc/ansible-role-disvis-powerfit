# docker build -t disvis .

FROM nvidia/opencl:devel
LABEL maintainer="Mario David <mariojmdavid@gmail.com>"
LABEL description="Run Disvis application"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc g++ git python-dev python-pip \
        python-pytools wget tar \
        libclfft-bin libclfft-dev libclfft2 \
        libffi-dev libfftw3-double3 libfftw3-single3 \
        libfftw3-long3 libfftw3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && cd /home \
    && pip install setuptools \
    && pip install cython numpy \
    && pip install decorator appdirs six \
    && pip install pyopencl \
    && git clone https://github.com/geggo/gpyfft.git \
    && cd gpyfft \
    && python setup.py install \
    && git clone https://github.com/haddocking/disvis.git \
    && cd disvis \
    && python setup.py install
