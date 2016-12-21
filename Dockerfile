FROM php:7.0-cli
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get update && apt-get install -y zlib1g-dev libsqlite3-dev nodejs build-essential git \
    && docker-php-ext-install -j$(nproc) zip pdo_mysql pdo_sqlite
CMD "install-composer.sh"
COPY composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer \
    && npm -g install gulp-cli bower \
