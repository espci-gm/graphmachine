#!/bin/bash
FROM espcigm/gm-base:latest
MAINTAINER Jean-Luc PLOIX

ARG DATAFILE=BJMA271EMOS.xlsx
ARG TESTFILE=
ARG DATARANGE=DATA
ARG TESTRANGE=EMOS
ARG CONFIGSTR=isomers0
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


ADD $DATAFILE ~/docker/data/
ADD $TESTFILE ~/docker/data/

WORKDIR /root/.local/lib/python2.7/site-packages/chem_gm/api

CMD python gm_apidemo.py $DATAFILE $TESTFILE -sr $DATARANGE -st $TESTRANGE -I $INIT -H $HIDDEN -C $CONFIGSTR -s $SEED -y $YES -v5 -b -R


