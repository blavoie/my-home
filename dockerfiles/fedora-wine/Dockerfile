#
# Build:
#	docker build -t fedora-wine fedora-wine
#
# Example run:
#	docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -e DISPLAY=unix$DISPLAY --privileged --name <NAME>  fedora-wine /bin/bash 
#

FROM fedora
MAINTAINER Bruno Lavoie <bl@brunol.com>


# Install wine and related packages

RUN dnf update -y && dnf install -y \
    wine \
 && dnf clean all

# Use latest version of winetricks from github

#RUN curl -SL 'http://winetricks.org/winetricks' -o /usr/local/bin/winetricks &&  \
#    chmod +x /usr/local/bin/winetricks

# Wine really doesn't like to be run as root, so let's use a non-root user
#USER wine
#ENV HOME /home/wine
#ENV WINEPREFIX /home/wine/.wine
#WORKDIR /home/wine

