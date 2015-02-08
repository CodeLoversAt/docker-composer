FROM codelovers/docker-hhvm

MAINTAINER Daniel Holzmann <daniel@codelovers.at>

ENV HOME /root

RUN apt-get update -qq && apt-get install -y -qq curl

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /srv

ENTRYPOINT ["hhvm", "/usr/local/bin/composer"]
