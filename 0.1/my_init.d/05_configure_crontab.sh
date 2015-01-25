#!/bin/bash
set -e

# Echo new cron into cron file
echo "00 15 * * * /apps/calaccess/bin/python /apps/calaccess/code/manage.py downloadcalaccessrawdata --noinput > /dev/null 2>&1 && /apps/calaccess/bin/python /apps/calaccess/code/manage.py buildcalaccesscampaignbrowser > /dev/null 2>&1" >> mycron

# Install new cron file
crontab mycron

# Erase temp file
rm mycron
