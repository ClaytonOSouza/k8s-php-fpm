#!/bin/sh

cat <> /var/www/lighttpd-logs &
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
