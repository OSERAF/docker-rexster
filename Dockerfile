# Tinkerpop Rexster Server
#

FROM centos:centos7
MAINTAINER Gregg Hanold "ghanold79@gmail.com"

#USER root
# Install unzip so we later can unpack
RUN yum -y install unzip

RUN yum -y update; yum clean all

# Rexster requires Java 7 to run
# install system deps
RUN yum -y install wget
RUN yum -y install install java-1.7.0-openjdk-devel

# Get Rester Server and install
ADD http://tinkerpop.com/downloads/rexster/rexster-server-2.6.0.zip /

RUN unzip rexster-server-2.6.0.zip
RUN rm rexster-server-2.6.0.zip
RUN mv rexster-server-2.6.0 rexster-server

# configure system
# Server listening port
EXPOSE 8182

# RexPro port 
EXPOSE 8184

# Shutdown listener port
EXPOSE 8183

ADD rexster.xml /

RUN mv rexster.xml /rexster-server/config
# USER oseraf
WORKDIR rexster-server

## Entrypoint
ENTRYPOINT ["bin/rexster.sh", "--start"]
