FROM phusion/baseimage:0.9.16
MAINTAINER Ben Welsh "ben.welsh@gmail.com"

# Set baseimage's environment variables.
ENV HOME /root

# Use baseimage's init system.
CMD ["/sbin/my_init"]

# Setup basic env
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Update OS
RUN apt-get update -y

# Install apt-get packages
RUN apt-get install -y \
    build-essential \
    fabric \
    git-core \
    libpq-dev \
    python \
    python-dev \
    python-pip \
    python-setuptools \
    python-virtualenv

# Create application group and user
RUN groupadd -g 1850 ccdc
RUN useradd -u 2014 -g 6 ccdc

# Install Apache
RUN apt-get install -y \
    apache2 \
    libapache2-mod-wsgi \
    libapache2-mod-rpaf

# Install MySQL
RUN apt-get install -y \
    mysql-server \
    libapache2-mod-auth-mysql \
    libmysqlclient-dev

# Install Django application
RUN mkdir /apps/
WORKDIR /apps/
RUN virtualenv calaccess
RUN /apps/calaccess/bin/pip install django
RUN mkdir /apps/calaccess/code/
WORKDIR /apps/calaccess/
RUN /apps/calaccess/bin/django-admin.py startproject --extension=py,.gitignore --template=https://github.com/california-civic-data-coalition/django-calaccess-project-template/archive/master.zip project code
RUN /apps/calaccess/bin/pip install -r /apps/calaccess/code/requirements.txt

# Set cron

# Clean up apt when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Boot the services and app
#ADD run.sh /run.sh
#RUN chmod 755 /*.sh
#CMD ["/run.sh"]

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mysqld"]

# Apache
EXPOSE 80
COPY httpd-foreground /usr/local/bin/
RUN chmod 755 /usr/local/bin/httpd-foreground
CMD ["httpd-foreground"]
