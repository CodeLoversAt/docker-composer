FROM debian:wheezy

ENV HOME /root

RUN apt-get update -qq && apt-get install -y -qq git curl wget apt-utils

# install HHVM
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN echo deb http://dl.hhvm.com/debian wheezy main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update
RUN apt-get install -y hhvm

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /srv

ENTRYPOINT ["hhvm", "/usr/local/bin/composer"]
