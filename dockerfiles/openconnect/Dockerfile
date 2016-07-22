#
# Build:
#       docker build -t blavoie/openconnect .
#
# Example run:
#       docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix --privileged blavoie/openconnect /bin/bash
#       docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -cap-add SYS_NET_ADMIN blavoie/openconnect /bin/bash
#

FROM fedora

MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN dnf update -y && dnf install -y \
    openconnect \
    openssh-clients \
    remmina

CMD ["/bin/bash"]
