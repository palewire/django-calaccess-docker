.PHONY: image container test

image:
	sudo docker build -t django-calaccess ./0.1/

container:
	sudo docker run \
		-p 127.0.0.1:80:80 \
		--name test-calaccess \
		-e MYSQL_DATABASE=calaccess \
		-e MYSQL_USER=ccdc \
		-e MYSQL_PASSWORD=mycrazypassword \
		-e DJANGO_USER=admin \
		-e DJANGO_EMAIL=foo@bar.com \
		-e DJANGO_PASSWORD=mydjangopassword \
		-d django-calaccess
test:
	sudo docker kill test-calaccess
	sudo docker rm test-calaccess
	make image
	make container
	sudo docker logs test-calaccess
