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

#### Base install with Java and repo file 

ENV HDP_VERSION=2.6.1.0 \
    JAVA_HOME=/usr/lib/jvm/jre-1.8.0
    
RUN yum install -y java-1.8.0-openjdk-headless \
                   which \
 && curl http://public-repo-1.hortonworks.com/HDP/centos7/2.x/updates/${HDP_VERSION}/hdp.repo > /etc/yum.repos.d/HDP.repo 

#### Install base client

RUN yum install -y hadoop-client \
                   hadoop-libhdfs \
                   openssl \
                   snappy \
                   snappy-devel \
                   lzo \
                   lzo-devel \
                   hadooplzo \
                   hadooplzo-native

#### Set configurations

COPY conf/*.tar.gz /tmp/

RUN ls -lah /tmp

RUN tar -vxzf /tmp/HDFS_CLIENT-configs.tar.gz       -C /etc/hadoop/conf \
 && tar -vxzf /tmp/YARN_CLIENT-configs.tar.gz       -C /etc/hadoop/conf \ 
 && tar -vxzf /tmp/MAPREDUCE2_CLIENT-configs.tar.gz -C /etc/hadoop/conf \
 && mkdir -p /etc/hadoop/conf/backup \
 && mv /etc/hadoop/conf/*.sh /etc/hadoop/conf/backup \
 && chmod -R go+rX /etc/hadoop 

#### Cleanup

RUN rm -rf /tmp/* \
 && yum clean all -y

##### Set running context
# TODO: make stuff dynamic with an entrypoint.sh script.
#   
#   See: 
#       https://github.com/nlesc-sherlock/hdfs-dfs-client-docker
#       https://denibertovic.com/posts/handling-permissions-with-docker-volumes/
#       https://wiki.dti.ulaval.ca/pages/editpage.action?pageId=64340440#
#

RUN mkdir /workdir
WORKDIR /workdir

ENV HADOOP_USER_NAME=hdfs   
ENTRYPOINT ["hdfs"]

