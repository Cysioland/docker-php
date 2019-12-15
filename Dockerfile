FROM php:7.3-cli
ADD install-composer.sh /tmp/
ADD .profile /root/
RUN apt-get update && apt-get install -y gnupg \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y zlib1g-dev libsqlite3-dev build-essential nodejs git wget coreutils libsodium-dev yarn unzip \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-install -j$(nproc) zip pdo_mysql pdo_sqlite \
    && docker-php-ext-enable xdebug \
    && /tmp/install-composer.sh \
    && echo 'export PATH=/root/.config/composer/vendor/bin:$PATH' >> /root/.profile \
    && npm -g install gulp-cli bower \
