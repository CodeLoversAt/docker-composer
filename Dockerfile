FROM ubuntu:14.04

MAINTAINER Daniel Holzmann <daniel@codelovers.at>

ENV HOME /root

RUN apt-get update -qq && apt-get install -y -qq git curl wget apt-utils

# install HHVM
RUN wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/ubuntu trusty main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update
RUN apt-get install -y hhvm

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /srv

ENTRYPOINT ["hhvm", "/usr/local/bin/composer"]
