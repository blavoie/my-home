FROM centos
MAINTAINER Bruno Lavoie <bl@brunol.com>

RUN yum update -y \
 && yum install -y wget

RUN yum install -y epel-release

RUN cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar vxzf -
ENTRYPOINT ["/root/.dropbox-dist/dropboxd"]
