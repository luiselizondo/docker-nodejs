# Node.js on Docker with Nginx serving static files 

## Build

	docker build -t yourname/nodejs .

## Create a data only container

	docker run -v /var/files --name APPFILES busybox true

## Run
By default, supervisor will start the start.js file, if your application uses a different file to start, change the supervisor file.

	docker run -d -p 8000:80 --volumes-from=APPFILES -v /path/to/app:/var/www --link mongodb:mongodb --link redis:redis luis/nodejs

### Show Environment variables

	docker run -itd -p 8000 --name nodejs -v /path/to/app:/var/www --link mongodb:mongodb --link redis:redis luis/nodejs env

### With Fig
You can use fig if you want:

	mongodb:
	  image: luis/mongodb
	  expose:
	   - "27017"
	  volumes_from: DBDATA
	web:
	  build: luis/nodejs
	  links:
	   - mongodb:mongodb
	  expose:
	   - "80"
	  volumes:
	   - "/path/to/app:/var/www"
	   - "/path/to/store/logs:/var/log/supervisor"
	  volumes_from: APPFILES
	  environment:
	   NODE_ENV: development

### Note
Take a look at the nginx.conf file if you need to adapt the static files / directories.