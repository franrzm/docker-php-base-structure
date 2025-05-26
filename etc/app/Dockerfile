FROM php:8.4-fpm AS base

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN apt-get install -y apt-transport-https && apt-get update -y

# Install git dependency
RUN apt-get install -y git

# Install PHP Postgresql extenssion
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pgsql pdo_pgsql;

# Install PHP ZIP extenssion
RUN apt-get install -y zlib1g-dev libzip-dev unzip zip \
    && docker-php-ext-install zip;

COPY ./conf/php-fpm.conf $PHP_INI_DIR/php-fpm.conf
COPY ./conf/www.conf $PHP_INI_DIR/www.conf

FROM base AS dev

# Install PHPUnit required extenssion
RUN docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-install pcntl;

HEALTHCHECK --interval=3s --timeout=10s CMD php -r "echo 'Status: OK';"

FROM base AS production

#FIXME: This do not work. Missing composer.* files
#TODO: COPY composer files and make it production ready
RUN composer install --no-dev --no-interaction --no-progress \
    && composer clear-cache --no-interaction \
    && composer dump-autoload --no-dev -a
