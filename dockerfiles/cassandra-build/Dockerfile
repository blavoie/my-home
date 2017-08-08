FROM centos
MAINTAINER Bruno Lavoie <bl@brunol.com>

#### Optionally use a proxy and disable fastest mirror to increase hit rate.

ENV PROXY=http://172.17.0.1:3128
ENV HTTP_PROXY=${PROXY} \
    HTTPS_PROXY=${PROXY} \
    FTP_PROXY=${PROXY} \
    proxy=${PROXY} \
    http_proxy=${PROXY} \
    https_proxy=${PROXY} \
    ftp_proxy=${PROXY}

RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf

#### Update

RUN yum update -y

#### Common dependencies

RUN yum install -y wget \
                   git \ 
                   java-1.8.0-openjdk-devel \
                   ant \
                   ant-junit \
                   rpm-build \
                   unzip
                   
#### Let's build

ENV CASSANDRA_VERSION 3.10
#ENV CASSANDRA_VERSION 3.11.0

RUN wget --progress=bar:force -O cassandra.zip https://github.com/apache/cassandra/archive/cassandra-${CASSANDRA_VERSION}.zip  \
 && unzip cassandra.zip  

#RUN cd cassandra-cassandra-${CASSANDRA_VERSION} \
# && ant -Drelease=true artifacts 
 
#mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
#echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
#cp build/apache-cassandra-*-src.tar.gz $RPM_BUILD_DIR/SOURCES/
#rpmbuild --define="version 3.10" -ba redhat/cassandra.spec
#clear; ls -lR $RPM_BUILD_DIR/{SRPMS,RPMS}/ 
 
#### Cleanup


RUN rm -rf /tmp/* \
 && yum clean all -y


                   
