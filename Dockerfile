FROM alpine:3.7

RUN apk add --update \
    php7-dev \
    gcc \
    musl-dev \
    make \
    && pecl install mongodb-1.5.3

WORKDIR /usr/lib/php7/modules