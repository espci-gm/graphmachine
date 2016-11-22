#!/bin/bash
FROM ubuntu
RUN apt-get update && apt-get install -qy x11-apps
RUN apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-tk \
    --no-install-recommends
RUN pip install --upgrade pip
RUN apt-get install -y build-essential
RUN apt-get install -y --no-install-recommends \
    libatlas-base-dev \
    gfortran \
    python-matplotlib
RUN pip install --user monal
RUN pip install --user chem_gm
RUN rm -rf /var/lib/apt/lists/*
WORKDIR /root/.local/lib/python2.7/site-packages/chem_gm/api
#ENTRYPOINT ["python"]
#CMD ["gm_apidemo.py"]


