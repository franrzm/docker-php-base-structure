FROM php:8

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

RUN apt-get update -y

# Install git dependency
RUN apt-get install -y git

# Install PHP Postgresql extenssion
RUN apt-get install -y libpq-dev \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pgsql pdo_pgsql;

# Install PHPUnit required extenssion
RUN docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-install pcntl;
