ARG BASE_IMAGE=ubuntu:bionic-20200311
FROM $BASE_IMAGE
ENV BASE_IMAGE=$BASE_IMAGE

LABEL maintainer "Budi Utomo <budtmo.os@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

#=============
# Set WORKDIR
#=============
WORKDIR /root

#==================
# General Packages
#------------------
# apache2
# 	HTTP server
# curl
#	Transfer data from or to a server 
# sudo
#	Sudo user
# unzip
#   Unzip zip file
# vim
# 	Editor
# wget
#	Network downloader
#==================
RUN apt-get -qqy update && \
	apt-get -qqy --no-install-recommends install \
	apache2 \
	curl \
	sudo \
	unzip \
	vim \
	wget \
  && rm -rf /var/lib/apt/lists/*

#==============================
# Install PHP and its packages
# Sources: https://manual.limesurvey.org/Installation_-_LimeSurvey_CE/en
#------------------------------
# libapache2-mod-php
# 	PHP-modul for Apache2 Webserver
# php
# 	PHP engine
# php-mbstring
# 	PHP-Extension for Multibyte String Function
# php-mysql
# 	PHP-Extension for using MySQL
# php-pgsql
#	PHP-Extension for using Postgres
# php-xml
# 	PHP-Extension for simple-xml
# php-gd
#	(Optional) PHP-Extension for captcha or statistic graph
# php-imap
#	(Optional) PHP-Extension for email
# php-ldap
#	(Optional) PHP-Extension for using LDAP function
# php-zip
#	(Optional) PHP-Extension to work with zip
#==============================
RUN apt-get -qqy update && \
	apt-get -qqy --no-install-recommends install \
	libapache2-mod-php \
	php php-mbstring php-mysql php-pgsql php-xml \
	php-gd php-imap php-ldap php-zip \
  && rm -rf /var/lib/apt/lists/*

#====================
# Install LimeSurvey
#====================
ARG LIMESURVEY_VERSION="3.25.6+201229"
ENV LIMESURVEY_VERSION=$LIMESURVEY_VERSION
RUN wget --no-check-certificate -O limesurvey.zip https://download.limesurvey.org/lts-releases/limesurvey${LIMESURVEY_VERSION}.zip \
	&& unzip limesurvey.zip \
	&& rm limesurvey.zip \
	&& mv lime* /var/www/html/limesurvey \
	&& chmod -R 777 /var/www/html/limesurvey

#======================
# Configure LimeSurvey
#======================
COPY configurations/limesurvey.conf /etc/apache2/sites-available/limesurvey.conf

#======================
# Start Apache2 service
#======================
EXPOSE 80
CMD /usr/sbin/apachectl -D FOREGROUND
