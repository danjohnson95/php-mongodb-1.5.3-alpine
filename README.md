# php-mongodb-1.5.3-alpine

This image compiles the mongodb-1.5.3 PHP extension for Alpine 3.7 x86_64 PHP 7.1.

## Usage

In your Dockerfile, you can copy the compiled extension to PHP's extension directory.

```Dockerfile
COPY --from=danjohnson95/php-mongodb-1.5.3-alpine:latest /usr/lib/php7/modules/mongodb.so /usr/lib/php7/modules
RUN echo 'extension=mongodb.so' >> /etc/php7/php.ini
```
