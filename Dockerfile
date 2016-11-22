#!/bin/bash
FROM ubuntu
RUN apt-get update && apt-get install -qy x11-apps
RUN apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    --no-install-recommends && \
    pip install --upgrade pip && \
    apt-get install -y build-essential && \
    pip install numpy && \
    apt-get install -y --no-install-recommends \
    libatlas-base-dev \
    gfortran && \
    pip install scipy && \
    apt-get install -y python-matplotlib \
    python-tk && \
    pip install monal && \
    pip install chem_gm && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /root/.local/lib/python2.7/site-packages/chem_gm/api
#ENTRYPOINT ["python"]
#CMD ["gm_apidemo.py"]


