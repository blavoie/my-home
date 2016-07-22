#
# Inspired from continuumio/anaconda 
#     https://registry.hub.docker.com/u/continuumio/anaconda/dockerfile/
#
# At the moment of testing the original image, ipython qtconsole weren't working.
# I've just tested the original recipe with fedora as a base image.
#
# Build:
#	docker build -t blavoie/anaconda .
#
# Example run:
#	docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix --privileged blavoie/anaconda /bin/bash
#

FROM fedora

MAINTAINER Bruno Lavoie <bl@brunol.com>
    
RUN dnf update -y && dnf install -y \
    bzip2 \
    ca-certificates \ 
    ncurses-compat-libs \
    tar \
    wget \
 && dnf clean all    

RUN wget --quiet https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/anaconda && \
    rm ~/anaconda.sh

ENV PATH /opt/anaconda/bin:$PATH

CMD [ "/bin/bash" ]
