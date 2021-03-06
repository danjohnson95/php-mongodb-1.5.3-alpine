FROM alpine:3.7

RUN apk add --update \
    php7-pear \
    php7-dev \
    gcc \
    musl-dev \
    make \
    openssl-dev \
    && pecl install mongodb-1.5.3

WORKDIR /usr/lib/php7/modules