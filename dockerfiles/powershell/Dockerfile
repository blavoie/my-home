FROM centos:7

RUN yum update -y \
 && curl https://packages.microsoft.com/config/rhel/7/prod.repo | tee /etc/yum.repos.d/microsoft.repo \
 && yum install -y powershell

ENTRYPOINT pwsh
