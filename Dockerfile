FROM php:8.0.3-fpm-buster
WORKDIR /var/www
RUN docker-php-ext-install bcmath pdo_mysql
RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client && docker-php-ext-install mcrypt pdo_mysql
ADD . /var/www
RUN chown -R www-data:www-data /var/www
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN apt-get install -y git zip unzip
RUN apt-get update
EXPOSE 9000
