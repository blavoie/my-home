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
#
#RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf

#### Update

RUN yum update -y 

#### Install dependencies

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0 \
    CLASSPATH=/hdfs-shell/lib

RUN yum install -y java-1.8.0-openjdk-headless \
                   unzip \
                   wget

WORKDIR /
    
RUN wget -q -O /hdfs-shell.zip https://github.com/avast/hdfs-shell/releases/download/v1.0.0/hdfs-shell-1.0.0.zip \
 && unzip hdfs-shell.zip 
 
RUN mv hdfs-shell-1.0 hdfs-shell \
 && chmod a+x /hdfs-shell/*.sh \
 && rm -rf /hdfs-shell.zip
 
#### Cleanup

RUN rm -rf /tmp/* \
 && yum clean all -y
 
##### Set running context

ENV HADOOP_USER_NAME=hdfs
WORKDIR /hdfs-shell
ENTRYPOINT ["/hdfs-shell/hdfs-shell.sh"]
