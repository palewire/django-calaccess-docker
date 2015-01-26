#!/bin/bash

# Listen on all interfaces
sed -i "s#^bind-address\s*=\s*.*#bind-address = 0.0.0.0#" /etc/mysql/my.cnf

# Log to stdout (remove logfile entry)
sed -i 's#^log_error = /var/log/mysql/error.log#console#' /etc/mysql/my.cnf

# Key_buffer_size is deprecated
sed -i 's#key_buffer_size =#key_buffer =#g' /etc/mysql/my.cnf

# Start it up
sudo service mysql restart;
