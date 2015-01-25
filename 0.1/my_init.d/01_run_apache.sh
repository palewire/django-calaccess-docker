#!/bin/bash
set -e
chown www-data:www-data /apps/ -R
echo "export MYSQL_DATABASE=$MYSQL_DATABASE" >> /etc/apache2/envvars
echo "export MYSQL_USER=$MYSQL_USER" >> /etc/apache2/envvars
echo "export MYSQL_PASSWORD=$MYSQL_PASSWORD" >> /etc/apache2/envvars
source /etc/apache2/envvars
service apache2 restart
