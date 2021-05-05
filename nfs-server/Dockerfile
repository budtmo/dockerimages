ARG BASE_IMAGE=ubuntu:focal-20210416
FROM ${BASE_IMAGE}

LABEL maintainer "Budi Utomo <budtmo.os@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

#====================
# Install NFS Server
#====================
RUN apt-get -qqy update && \
	apt-get -qqy --no-install-recommends install \
	nfs-kernel-server \
  && rm -rf /var/lib/apt/lists/*

#======================
# Configure NFS Server
#======================
ENV SHARED_VOLUME_PATH=/sharedvolume
RUN mkdir -p ${SHARED_VOLUME_PATH} && chmod 777 ${SHARED_VOLUME_PATH} && echo "${SHARED_VOLUME_PATH} *(rw,fsid=0,async,no_subtree_check,no_auth_nlm,insecure,no_root_squash)" >> /etc/exports
VOLUME ${SHARED_VOLUME_PATH}
EXPOSE 2049

CMD /usr/sbin/rpcbind && /etc/init.d/nfs-kernel-server start && sleep infinity
