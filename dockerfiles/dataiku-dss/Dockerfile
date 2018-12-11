FROM centos
MAINTAINER Bruno Lavoie <bl@brunol.com>

#### Optionally use a proxy and disable fastest mirror to increase hit rate.

#ENV PROXY=http://172.17.0.1:3128
#ENV HTTP_PROXY=${PROXY} \
#    HTTPS_PROXY=${PROXY} \
#    FTP_PROXY=${PROXY} \
#    proxy=${PROXY} \
#    http_proxy=${PROXY} \
#    https_proxy=${PROXY} \
#    ftp_proxy=${PROXY}

#RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf

#### Update

RUN yum update -y

#### Common dependencies

RUN yum install -y wget \
                   epel-release                   

##############################
#### Install HDP client
##############################

#ENV HDP_VERSION=2.6.1.0 \
#    JAVA_HOME=/usr/lib/jvm/jre-1.8.0
    
#RUN yum install -y java-1.8.0-openjdk-headless \
#                   which \
# && curl http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/${HDP_VERSION}/hdp.repo > /etc/yum.repos.d/HDP.repo

## Install base client
 
#RUN yum install -y hadoop-client \
#                   hadoop-libhdfs \
#                   openssl \
#                   snappy \
#                   snappy-devel \
#                   lzo \
#                   lzo-devel \
#                   hadooplzo \
#                   hadooplzo-native
                   
##############################
#### Install Conda
##############################



##############################
#### Install Dataiku
##############################

ENV DATAIKU_VERSION=4.3.3 \
    DATAIKU_DIR=/app/dataiku

RUN yum install -y git \
                   nginx \
                   unzip \
                   zip \
                   mesa-libGL \
                   libSM \
                   libXrender \
                   alsa-lib \
                   libgfortran \
                   java-1.8.0-openjdk \
                   libgomp
                   
RUN useradd dataiku \
 && mkdir -p /app/dataiku \
             /data/dataiku \
 && chown -R dataiku:dataiku /app/dataiku \
                             /data/dataiku
  
USER dataiku

RUN wget --progress=bar:force -O /tmp/dataiku-dss.tar.gz http://repo-svd.svc.ulaval.ca/pkgs/dataiku/dataiku-dss-${DATAIKU_VERSION}.tar.gz 
RUN tar -vxzf /tmp/dataiku-dss.tar.gz -C /app/dataiku 

RUN cd /app/dataiku/dataiku-dss-${DATAIKU_VERSION} \ 
 && ./installer.sh -d /data/dataiku -p 11000 

#### Cleanup

USER root

RUN rm -rf /tmp/* \
 && yum clean all -y

##############################
#### Running context
##############################

USER dataiku

# TODO

EXPOSE 11000



