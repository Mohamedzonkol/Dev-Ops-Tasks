FROM php:7.3-fpm

COPY . /var/www/mobadra.com/html
WORKDIR /var/www/mobadra.com/html

RUN docker-php-ext-install pdo pdo_mysql

EXPOSE 9000

CMD ["php-fpm"]
