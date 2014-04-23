FROM ubuntu:12.04
MAINTAINER Luis Elizondo "lelizondo@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python python-software-properties curl git
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -qq update
RUN apt-get install -y nodejs
RUN npm install -g expressjsmvc express nodemon bower

EXPOSE 3000

ADD start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /var/www

CMD ["/start.sh"]
