FROM centos:7

RUN yum update -y

RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm \
 && yum install -y centos-release-scl \
                   epel-release \
 && yum install -y rpm-build \
                   yum-utils \
                   make \
                   gcc 
                   
####  PostgreSQL specific stuff

# Install build dependencies

RUN yum-builddep -y postgresql12

# Download sources and make it available for everyone

RUN yumdownloader --source postgresql12 \
 && mv postgresql12-*.src.rpm /tmp \
 && chmod a+r /tmp/postgresql12-*
 
# Install server packages, simply because it creates the postgres user

RUN yum install -y postgresql12-server 
 
# Install sources for ROOT user
 
RUN rpm -ivh /tmp/postgresql12-*.src.rpm

# Try to install sources for BUILDER user

RUN useradd builder 
USER builder
RUN rpm -ivh /tmp/postgresql12-*.src.rpm

# Try to install sources for POSTGRES user

USER postgres
RUN rpm -ivh /tmp/postgresql12-*.src.rpm

# Switch back to root, because we want to test this image with root, postgres, and builder user

USER root
RUN yum install -y vim
