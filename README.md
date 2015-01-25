# django-calaccess-docker

Docker image packaging for our CAL-ACCESS applications.

Still experimental, so don't get your hopes up.

### Starting a docker container

```bash
$ sudo docker build -t django-calaccess .
```

```bash
$ sudo docker run \
    -p 127.0.0.1:8080:80 \
    --name test-calaccess \
    -e MYSQL_DATABASE=ccdc \
    -e MYSQL_USER=ccdc \
    -e MYSQL_PASSWORD=ccdc \
    -d django-calaccess
```
