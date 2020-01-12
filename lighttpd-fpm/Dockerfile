FROM alpine

EXPOSE 8080

COPY . /tmp/

RUN adduser -D -h /var/www/ -s /sbin/nologin lighttpd && \
mkdir -p /var/www/.ssh && \
apk add --no-cache lighttpd && \
mv /tmp/lighttpd.conf /etc/lighttpd/lighttpd.conf && \
mv /tmp/mod_fastcgi_fpm.conf /etc/lighttpd/mod_fastcgi_fpm.conf && \
mv /tmp/handlers /var/www/ && \
mv /tmp/docker-entrypoint.sh / && \
mkdir -p /var/www/htdocs && \
mkfifo -m 600 /var/www/lighttpd-logs && \
chown -R lighttpd: /var/www/

WORKDIR /var/www/htdocs
USER lighttpd

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]
