default: help

.PHONY: help
help: # Show all the available commands and its descriptions
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: build
build: # Build the app
	docker-compose build

.PHONY: up
up: # Start the app
	docker-compose up -d

.PHONY: down
down: # Stop the app
	docker-compose down

.PHONY: restart
restart: # Restart the app
	make down && make build && make up

.PHONY: test
test: # Run all the app tests
	docker-compose run --rm composer test

.PHONY: bash
bash: # Bash into the specified docker container
	docker exec -ti $(service) /bin/bash

.PHONY: install
install: # Install all the composer dependencies
	docker-compose run --rm composer install

.PHONY: update
update: # Update all the composer dependencies
	docker-compose run --rm composer update

.PHONY: pull
pull: # Stops the app, pull the git changes for the current branch, install all composer dependencies and builds the app
	make down
	git pull
	make build
