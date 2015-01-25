#!/bin/bash
set -e
chown ccdc:ccdc /apps/ -R
source /etc/apache2/envvars
service apache2 restart
