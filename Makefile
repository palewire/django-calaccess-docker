.PHONY: image container test

image:
	sudo docker build -t django-calaccess ./0.1/

container:
	sudo docker run \
		-p 127.0.0.1:80:80 \
		--name test-calaccess \
		-e MYSQL_DATABASE=ccdc \
		-e MYSQL_USER=ccdc \
		-e MYSQL_PASSWORD=ccdc \
		-d django-calaccess

test:
	sudo docker kill test-calaccess
	sudo docker rm test-calaccess
	make image
	make container
	sudo docker logs test-calaccess
