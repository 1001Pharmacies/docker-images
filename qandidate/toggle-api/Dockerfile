FROM php:7.0-apache

RUN apt-get update && apt-get install -y \
        curl \
        git \
        zlib1g-dev \
        libicu-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip pdo_mysql intl

RUN curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar && chmod +x /usr/local/bin/composer

RUN a2enmod rewrite

COPY vhost.conf /etc/apache2/sites-enabled/000-default.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

RUN git clone https://github.com/qandidate-labs/qandidate-toggle-api.git .

ADD .env.dist .
RUN cp .env.dist .env \
  && composer install --no-interaction --no-dev

ENV TOGGLE__DEBUG="true" \
    TOGGLE__ALLOWED_ORIGINS='["*"]' \
    TOGGLE__REDIS_DSN="tcp://redis:6379" \
    TOGGLE__PREFIX="feature_toggle"

RUN rm -rf app/cache/*

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["apache2ctl", "-DFOREGROUND"]