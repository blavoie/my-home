#
# Run Toad windows app in a container with Wine.
#
# Build:
#	docker build -t toad-oracle-x64 toad-oracle-x64
#
# Example run:
#	docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/snd:/dev/snd -e DISPLAY=unix$DISPLAY --privileged --name toad-oracle-x64 toad-oracle-x64 /bin/bash   
# 
# To install Toad:
#	wine /usr/toad.for.oracle.12.6.commercial.exe
#
# Once installed, call Toad:
# 	wine "/root/.wine/drive_c/Toad/Toad for Oracle 12.6/Toad.exe"
#
#
FROM fedora-wine
MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN dnf update -y 

#COPY ./toad.for.oracle.12.6.commercial.exe /usr/src/toad.exe
#COPY ./toad.dba.suite.for.oracle.x64.12.6.exe /usr/src/toad.exe

#CMD [ "wine", "/usr/src/toad.exe" ]



