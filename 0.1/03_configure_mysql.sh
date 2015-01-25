#!/bin/bash
set -e
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -e "create database $MYSQL_DATABASE";
