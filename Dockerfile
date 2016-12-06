#!/bin/bash
FROM ubuntu:15.04
MAINTAINER Jean-Luc PLOIX
RUN apt-get update \
    && apt-get install -y \
#    x11vnc \
#    xvfb \
#    && apt-get install -y \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-tk \
    --no-install-recommends  \
    && pip install --upgrade pip \
    && apt-get install -y build-essential \
    --no-install-recommends \
    libatlas-base-dev \
    gfortran 
    #python-matplotlib
RUN pip install --user --no-cache-dir monal
RUN pip install --user --no-cache-dir chem_gm
RUN rm -rf /var/lib/apt/lists/*
#RUN mkdir ~/.vnc
# Setup a password
#RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
WORKDIR /root/.local/lib/python2.7/site-packages/chem_gm/api
ENTRYPOINT ["python"]
CMD ["-m", "gm_apidemo", "Base321E_chem.xlsx", "-aall", "-sr", "DATA", "-st", "TEST49", "-I", "24", "-H", "-4", "-CI1_isomers0_chirals1_qs0", "--seed", "1947", "-v5", "-rd", "2", "-b", "-R1"]


