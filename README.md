# Basic PHP + PostgreSQL in Docker

Basic ready-to-use PHP and PostgreSQL structure, with PHPUnit, composer and Make commands.

### Getting Started
#### Prerequisites
- You need to have [Docker](https://docs.docker.com/get-docker) and [Docker Compose](https://github.com/docker/compose) installed in your machine.
- It is also necessary to have installed the [Build Essentials package](https://packages.debian.org/es/sid/build-essential) (or the equivalent in your OS) to use [Makefile](https://es.wikipedia.org/wiki/Make) commands.
- Copy `./.env.dist` file into `.env` and configure the variables in there (but with the default values everything will work for a local environment). 

For building the app you only need to execute `make build` in the root project folder.

After building the app, you can start running it with the following command `make up`.

Now, there is a working PostgreSQL database and a PHP app eagerly waiting for the code.
The API is runing at [http://localhost:8080](http://localhost:8080) (or the port you have configured in ${APP_PORT}.

You can stop the app by running `make down`.

### Available commands
Executing the following command prints the whole list of available commands and its description:
```shell
make help
```

### Folder Structure
This repo has the following folder structure:
```shell
root
├── app # Where the PHP code lives
│   ├── src # The app code
│   │   └── index.php
│   └── tests # The tests
│   ├── composer.json
│   ├── composer.lock
│   ├── phpunit.xml
├── etc # Where the infrastructure lives
│   ├── db
│   │   ├── entrypoint-scripts
│   │   │  └── init.sql
│   │   ├── Dockerfile
│   └── app
│   │   ├── conf
│   │   │  └── php-fpm.ini
│   │   └── Dockerfile
│   └── server
│       ├── conf
│       │  └── nginx.conf
│       └── Dockerfile
├── compose.yml
├── Makefile
└── README.md

```
