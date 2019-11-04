# Minimal-Dokuwiki (Customized)

## Summary

Simple dokuwiki with alpine, nginx, and php-fpm7.


## Description

You can create a very simple personal or organization knowledge base with a minimal footprint with docker.

This is an image I created that user Alpine Linux (a very small footprint OS), Nginx, and PHP 7 (php-fpm). Services are managed by supervisord.


## PreRequirement

- install docker, docker-compose


## To Start

```sh

cd /path/to/Minimal-Dokuwiki

make up
```