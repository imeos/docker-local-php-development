# Local LAMP Stack using Docker

A repository containing the Docker files to build a LAMP stack for local development.

After startup, its accessible via [http://localhost:5678](http://localhost:5678).


## Install Docker Desktop

Install the [Docker Desktop Client](https://www.docker.com/products/docker-desktop), either via the offical installer, or a package manger of your choice, like Homebrew:

```sh
brew install --cask docker
```


## Start the stack
```sh
docker compose up
```

Use the `-d` flag to start in detached mode, e.g. without logging the container outputs.


## Stop the stack
```sh
docker compose down
```


## Volumes

This stack links these folders inside this directory:
- `/volumes/www` will be linked to the php-apache apps web folder. Put your HTML and PHP files in here.
- `/volumes/database` will be linked to the MariaDBs database folder and contain all those `db.opt` files, so you can work with or backup them.


## Customizing settings

You can easily customize PHP and Apache settings, by editing `/php/local.ini` and/or `/apache/http-vhosts.conf`, before restarting this stack.


## Rebuild custom PHP image
```sh
docker build -t php-apache -f images/php-apache.dockerfile .
```


## Images used:
- [php:8.0.8-apache](https://hub.docker.com/_/php) (customized via `/images/php-apache.dockerfile`)
- [mariadb:10.6.3](https://hub.docker.com/_/mariadb)
