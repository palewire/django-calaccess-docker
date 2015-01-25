#!/bin/bash
set -e
/apps/calaccess/bin/python /apps/calaccess/code/manage.py migrate;
echo "from django.contrib.auth.models import User; User.objects.create_superuser('$DJANGO_USER', '$DJANGO_EMAIL', '$DJANGO_PASSWORD')" | /apps/calaccess/bin/python /apps/calaccess/code/manage.py shell
/apps/calaccess/bin/python /apps/calaccess/code/manage.py collectstatic --noinput;
