# django-calaccess-docker

Docker image packaging for our CAL-ACCESS applications.

Still experimental, so don't get your hopes up.

### Starting a docker container

```bash
$ sudo docker build -t django-calaccess .
```

```bash
$ sudo docker run \
    --name test-calaccess \
    -d django-calaccess \
    -p 127.0.0.1:8080:80 \
    -e MYSQL_DATABASE=calaccess \
    -e MYSQL_USER=ccdc \
    -e MYSQL_PASSWORD=mycrazypassword \
    -e DJANGO_USER=admin \
    -e DJANGO_EMAIL=foo@bar.com \
    -e DJANGO_PASSWORD=mydjangopassword
```
