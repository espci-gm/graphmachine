#!/bin/bash
FROM ubuntu:15.04
MAINTAINER Jean-Luc PLOIX

ARG DATAFILE=Base321E_chem.xlsx
ARG TESTFILE=
ARG DATARANGE=DATA
ARG TESTRANGE=TEST49
ARG CONFIGSTR=I1_isomers0_chirals1_qs0
ARG SEED=-1
ARG YES=0
ARG INIT=24
ARG HIDDEN=-4

ENV DATAFILE=$DATAFILE
ENV TESTFILE=$TESTFILE
ENV DATARANGE=$DATARANGE
ENV TESTRANGE=$TESTRANGE
ENV CONFIGSTR=$CONFIGSTR
ENV SEED=$SEED
ENV YES=$YES
ENV INIT=$INIT
ENV HIDDEN=$HIDDEN


RUN apt-get update \
    && apt-get install -y \
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

RUN mkdir ~/docker
RUN mkdir ~/docker/data
ADD $DATAFILE ~/docker/data/
ADD $TESTFILE ~/docker/data/

#RUN mkdir /docker
#RUN mkdir ~/docker/result
#VOLUME ~/docker/result:/docker/result

#RUN mkdir ~/.vnc
# Setup a password
#RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
WORKDIR /root/.local/lib/python2.7/site-packages/chem_gm/api
#ENTRYPOINT ["python"]
CMD python gm_apidemo.py $DATAFILE $TESTFILE -sr $DATARANGE -st $TESTRANGE -I $INIT -H $HIDDEN -C $CONFIGSTR --seed $SEED -y $YES -v5 -b -R


