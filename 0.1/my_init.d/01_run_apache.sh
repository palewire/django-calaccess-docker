#!/bin/bash
set -e
chown www-data:www-data /apps/ -R
source /etc/apache2/envvars
service apache2 restart
