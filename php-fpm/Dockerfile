FROM alpine

COPY . /tmp

RUN adduser -D -h /var/www/ -s /sbin/nologin php && \
  apk add --no-cache php7-fpm php-openssl php-json php-curl php-gd php-mysqli php-sqlite3 php-mbstring \
  php-pdo php-pdo_mysql php-pdo_sqlite php-session php-iconv php7-pecl-memcached php-xml php-gd && \
  mkfifo -m 600 /var/www/fpm-logs && \
  chown -R php:php /var/www/ && \
  mv /tmp/www.conf /etc/php7/php-fpm.d/www.conf && \
  mv /tmp/php-fpm.conf /etc/php7/php-fpm.conf && \
  mv /tmp/docker-entrypoint.sh /

WORKDIR /var/www/htdocs/

EXPOSE 9000
USER php
CMD ["sh", "/docker-entrypoint.sh"]
