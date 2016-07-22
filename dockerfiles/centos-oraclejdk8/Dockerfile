#
# Build:
#       docker build -t blavoie/centos-oraclejdk8 .
#
# Example run:
#       docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix --privileged blavoie/centos-oraclejdk8 /bin/bash
#

FROM centos

ENV JAVA_VERSION=8 \
    JAVA_UPDATE=101 \
    JAVA_BUILD=13

RUN yum update -y && yum install -y \
    wget \
 && dnf clean all    
      
RUN wget --quiet --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
         "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.rpm" -O ~/jdk.rpm && \
    rpm -ivh ~/jdk.rpm && \
    rm -f ~/jdk.rpm

RUN yum clean all  

WORKDIR /

CMD ["/bin/bash"]



