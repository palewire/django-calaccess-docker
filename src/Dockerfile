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
RUN mkdir -p /home/ccdc/

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

# Clean up apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Django application
RUN mkdir /apps/
WORKDIR /apps/
RUN virtualenv calaccess
RUN /apps/calaccess/bin/pip install django
RUN mkdir /apps/calaccess/code/
WORKDIR /apps/calaccess/
RUN /apps/calaccess/bin/django-admin.py startproject --extension=py,.gitignore --template=https://github.com/california-civic-data-coalition/django-calaccess-project-template/archive/v0.1.0.zip project code
RUN /apps/calaccess/bin/pip install -r /apps/calaccess/code/requirements.txt

# Configure Apache
EXPOSE 80
COPY apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY apache/apache2.conf /etc/apache2/apache2.conf

# Fire up all the services
ADD my_init.d/01_run_apache.sh /etc/my_init.d/01_run_apache.sh
ADD my_init.d/02_run_mysql.sh /etc/my_init.d/02_run_mysql.sh
ADD my_init.d/03_configure_mysql.sh /etc/my_init.d/03_configure_mysql.sh
ADD my_init.d/04_configure_django.sh /etc/my_init.d/04_configure_django.sh
ADD my_init.d/05_configure_crontab.sh /etc/my_init.d/05_configure_crontab.sh
RUN chmod 755 /etc/my_init.d/*.sh
