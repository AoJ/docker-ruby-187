# Project: docker ruby 1.8.7
# Author: AooJ <aooj@n13.cz>
# usage:
#	make build	- build new image from Dockerfile
#	make run	- debug run already created image by tag
#	make debug	- build and run bash in docker


NAME=aooj/ruby187
VERSION=1.0


build:
	docker build -t $(NAME):$(VERSION) .


run:
	docker run -t -i $(NAME):$(VERSION)

debug: build
	docker run --rm -t -i $(NAME):$(VERSION) /bin/bash	


.PHONY: build run debug
