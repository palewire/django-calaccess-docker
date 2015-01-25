# django-calaccess-docker

Docker image packaging for our CAL-ACCESS applications.

Still experimental, so don't get your hopes up.

### Starting a docker container

First the image.

```bash
$ sudo docker build -t ccdc/django-calaccess .
```

Then the container.

```bash
$ sudo docker run \
	-p 127.0.0.1:80:80 \
	--name test-calaccess \
	-e MYSQL_DATABASE=calaccess \
	-e MYSQL_USER=ccdc \
	-e MYSQL_PASSWORD=mycrazypassword \
	-e DJANGO_USER=admin \
	-e DJANGO_EMAIL=foo@bar.com \
	-e DJANGO_PASSWORD=mydjangopassword \
	-d ccdc/django-calaccess
```
