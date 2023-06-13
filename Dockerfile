FROM php:8.2-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

ENV COMPOSER_ALLOW_SUPERUSER=1

COPY ./symfony_backend ./web-api

WORKDIR /var/www/html/web-api

RUN php composer.phar install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction;
RUN php composer.phar dump-autoload --optimize