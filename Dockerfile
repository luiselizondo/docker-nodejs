FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get update --fix-missing
RUN apt-get update --fix-missing
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -

RUN apt-get install -y supervisor nodejs imagemagick git openssl make node-gyp
RUN npm install -g npm@latest
RUN npm install -g express bower mocha sinon should assert grunt gulp 
RUN apt-get update --fix-missing

RUN mkdir -p /var/log/supervisor

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord-nodejs.conf

RUN ln -s /usr/bin/nodejs /usr/local/bin/node

EXPOSE 3000

WORKDIR /var/www

