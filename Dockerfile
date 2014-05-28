FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y nodejs npm
RUN npm install -g expressjsmvc express bower
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3000

WORKDIR /var/www

CMD ["/usr/bin/supervisord", "-n"]
