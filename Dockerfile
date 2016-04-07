FROM smebberson/alpine-apache:1.0.0
MAINTAINER Vojtěch Biberle <vojtech.biberle@gmail.com>

ADD root /

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --update add \
  php \
  php-apache2 \
  php-pdo \
  php-json \
  php-openssl \
  php-mysql \
  php-pdo_mysql \
  php-mcrypt \
  php-sqlite3 \
  php-pdo_sqlite \
  php-ctype \
  php-zlib \
  php-iconv \
  php-xdebug@testing \
  ca-certificates

RUN sed -i "s/extension/zend_extension/g" /etc/php/conf.d/xdebug.ini 

VOLUME ["/var/www/localhost"]
