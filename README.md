# Node.js on Docker

## Build

	docker build -t yourname/nodejs .

## Run
By default, supervisor will start the start.js file, if your application uses a different file to start, change it.

	docker run -d -p 8000:3000 --name nodejs --volumes-from=APPFILES -v /path/to/app:/var/www --link mongodb:mongodb --link redis:redis luis/nodejs

### Show Environment variables

	docker run -itd -p 8000 --name nodejs -v /home/luis/Code/application:/var/www --link mongodb:mongodb --link redis:redis luis/nodejs env
