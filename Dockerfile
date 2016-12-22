FROM php:7.0-cli
ADD install-composer.sh /tmp/
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get update && apt-get install -y zlib1g-dev libsqlite3-dev nodejs build-essential git wget base64 \
    && docker-php-ext-install -j$(nproc) zip pdo_mysql pdo_sqlite \
    && /tmp/install-composer.sh \
    && npm -g install gulp-cli bower \
