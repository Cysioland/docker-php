FROM php:7.0-cli
ADD install-composer.sh /tmp/
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get update && apt-get install -y zlib1g-dev libsqlite3-dev nodejs build-essential git wget coreutils \
    && docker-php-ext-install -j$(nproc) zip pdo_mysql pdo_sqlite \
    && /tmp/install-composer.sh \
    && echo 'export PATH=/root/.composer/vendor/bin:$PATH' >> /root/.profile \
    && npm -g install gulp-cli bower \
