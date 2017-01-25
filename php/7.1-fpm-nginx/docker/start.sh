#! /bin/bash

if [ -d "/var/www/html/app/cache" ]; then
  chown -R www-data:root /var/www/html/app/cache
  chown -R www-data:root /var/www/html/app/logs
  chmod 777 /var/www/html/app/cache
  chmod 777 /var/www/html/app/logs
fi


if [ -d "/var/www/html/var/cache" ]; then
  chown -R www-data:root /var/www/html/var/cache
  chown -R www-data:root /var/www/html/var/logs
  chmod 777 /var/www/html/var/cache
  chmod 777 /var/www/html/var/logs
fi

/usr/bin/supervisord
