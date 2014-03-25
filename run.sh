#!/bin/bash

docker run -itd -p 8000 -v /home/luis/Docker/blog:/var/www --name nodejs luis/nodejs 
