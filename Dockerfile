FROM php:7.0-cli
ADD install-composer.sh /tmp/
ADD .profile /root/
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get update && apt-get install -y zlib1g-dev libsqlite3-dev build-essential git wget coreutils libsodium-dev \
    && docker-php-ext-install -j$(nproc) zip pdo_mysql pdo_sqlite \
    && /tmp/install-composer.sh \
    && echo 'export PATH=/root/.config/composer/vendor/bin:$PATH' >> /root/.profile \
    && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash \
    && nvm install node \
    && npm -g install gulp-cli bower \
