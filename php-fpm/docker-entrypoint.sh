#!/bin/sh

cat <> /var/www/fpm-logs &
exec php-fpm7 --nodaemonize -e
