FROM ubuntu:18.04
MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y wget \
                       git \
                       gconf2 \
                       gconf-service \
                       gvfs-bin \
                       libgtk2.0-0 \
                       libnss3 \
                       libxtst6 \
                       python \
                       xdg-utils \
                       libnotify4 \
 && wget https://github.com/BoostIO/boost-releases/releases/download/v0.11.11/boostnote_0.11.11_amd64.deb -O boostnote.deb \
 && dpkg -i boostnote.deb \
 && rm -rf *.deb \
 && rm -rf /var/lib/apt/lists/* 


