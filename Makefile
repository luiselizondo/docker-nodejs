CURRENT_DIRECTORY := $(shell pwd)

build:
	@docker build --tag=luis/nodejs $(CURRENT_DIRECTORY)

build-no-cache:
	@docker build --no-cache --tag=luis/nodejs $(CURRENT_DIRECTORY)

.PHONY: build build-no-cache