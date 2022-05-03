FROM php:8.1-fpm-alpine as base

WORKDIR /var/www/html

RUN apk --no-cache add bash nano

#
# This stage builds the production code based on the repository
#
FROM base as build

COPY . .

RUN apk add --no-cache git \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && mkdir -p /.composer /.config \
 && chmod -R 2777 /.composer /.config \
 && composer install --no-interaction --optimize-autoloader --no-dev --prefer-dist

#
# This is the final image which has only the software and code needed for production
#
FROM base as production

COPY --from=build /var/www /var/www


FROM nginxinc/nginx-unprivileged:1.20-alpine as nginx

COPY .docker/nginx/rootfs/etc/nginx/conf.d/production.conf /etc/nginx/conf.d/default.conf
COPY public /var/www/html/public
