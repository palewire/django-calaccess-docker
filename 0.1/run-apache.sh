#!/bin/bash
chown www-data:www-data /apps/ -R
source /etc/apache2/envvars
exec apache2 -D FOREGROUND
