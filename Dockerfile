#!/bin/bash
FROM  jupyter/minimal-notebook
MAINTAINER Jean-Luc PLOIX

USER root
#RUN apt-get update 
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade --user --no-cache-dir monal
RUN pip3 install --upgrade --user --no-cache-dir chem_gm

