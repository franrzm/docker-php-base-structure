# Basic PHP + PostgreSQL in Docker

Basic ready-to-use PHP v8 and PostgreSQL v16 structure, with PHPUnit, composer and Make commands.

### Getting Started
Execute the following commands for building and starting the app:
```shell
make build
```
```shell
make up
```
And the following for stopping the app:
```shell
make down
```

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
│   └── php
│       └── Dockerfile
├── docker-compose.yml
├── Makefile
└── README.md

```
