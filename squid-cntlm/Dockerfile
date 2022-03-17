ARG BASE_IMAGE=ubuntu:focal-20220113
FROM $BASE_IMAGE
ENV BASE_IMAGE=$BASE_IMAGE

ENV DEBIAN_FRONTEND=noninteractive

#=============
# Set WORKDIR
#=============
WORKDIR /root

#=================
# General Packages
#-----------------
# ca-certificates
#   SSL client
# curl
#   Transfer data from or to a server
# cntlm
#   Proxy
# supervisor
#   Parallel process
# vim
#   Editor
#==================
RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    ca-certificates \
    curl \
    cntlm \
    supervisor \
    vim \
  && rm -rf /var/lib/apt/lists/*

#===============
# Install Squid
#---------------
# squid
# 	Proxy Server
#==================
ARG TOOL_VERSION="4.10-1ubuntu1.5"
ENV SQUID_VERSION=${TOOL_VERSION}
ARG RELEASE_TAG_VERSION="test"
ENV RELEASE_TAG_VERSION=${RELEASE_TAG_VERSION}
RUN apt-get -qqy update && \
	apt-get -qqy --no-install-recommends install \
	squid=${SQUID_VERSION} \
  && rm -rf /var/lib/apt/lists/*

ENV CACHE_PATH="/var/cache/squid"
RUN mkdir -p ${CACHE_PATH} \
  && chown proxy:proxy ${CACHE_PATH}

#======
# PORT
#======
EXPOSE 3130

#==============
# Run processes
#==============
ENV LOG_PATH=/var/log/supervisor
COPY supervisord.conf /root/
CMD /usr/bin/supervisord --configuration supervisord.conf
