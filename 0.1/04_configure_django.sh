#!/bin/bash
/apps/calaccess/bin/python /apps/calaccess/code/manage.py migrate;
/apps/calaccess/bin/python /apps/calaccess/code/manage.py collectstatic --noinput;
