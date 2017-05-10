FROM fedora

MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN dnf update -y \
 && dnf install -y openconnect \
                   openssh-clients \
                   remmina \
 && dnf clean all

CMD ["/bin/bash"]
