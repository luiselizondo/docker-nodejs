FROM ubuntu:14.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y nodejs npm
RUN npm install -g expressjsmvc express bower

RUN apt-get update --fix-missing

RUN apt-get install -y supervisor nginx
RUN mkdir -p /var/log/supervisor

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get autoremove -y

ADD ./config/nginx.conf /etc/nginx/nginx.conf
ADD ./config/supervisord.conf /etc/supervisor/conf.d/supervisord-web.conf

RUN ln -s /usr/bin/nodejs /usr/local/bin/node

EXPOSE 80

WORKDIR /var/www

VOLUME ["/var/files"]

CMD ["/usr/bin/supervisord", "-n"]
