FROM fedora:latest

MAINTAINER Bruno Lavoie <bl@brunol.com>

### INSTALL PACKAGES

RUN dnf update -y

RUN dnf install -y openconnect \
                   openssh-clients \
                   procps-ng \
                   remmina \
                   openssh-server \
                   passwd \
                   net-tools \
                   nc \
                   tcpdump \
                   bind-utils \
                   iptraf-ng \
                   nmon

### SETUP

ARG SSH_USERNAME
ENV SSH_USERNAME ${SSH_USERNAME:-ssh}

ARG SSH_PASSWORD
ENV SSH_PASSWORD ${SSH_PASSWORD:-ssh}

RUN ssh-keygen -A \
 && useradd $SSH_USERNAME \
 && echo "${SSH_USERNAME}:${SSH_PASSWORD}" | chpasswd \
 && dnf clean all

ADD README.md /
ADD init.sh /
ADD env /

CMD ["/bin/bash"]

