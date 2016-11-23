#!/bin/bash
FROM ubuntu:15.04
RUN apt-get update \
    && apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-tk \
    --no-install-recommends \
    && pip install --upgrade pip \
    && apt-get install -y build-essential \
    --no-install-recommends \
    libatlas-base-dev \
    gfortran \
    python-matplotlib
RUN pip install --user monal
RUN pip install --user chem_gm
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /root/.local/lib/python2.7/site-packages/chem_gm/api
#ENTRYPOINT ["python"]
#CMD ["gm_apidemo.py"]


