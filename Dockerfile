# Setting up a pombola instance on ubuntu

FROM i686/ubuntu:14.04 
MAINTAINER James Mwai <smartemwa@gmail.com>

#Update the server

#RUN cat > /etc/apt/sources.list deb http://archive.ubuntu.com/ubuntu precise main universe multiverse
RUN apt-get update 

#Lets bootstrap our server
#Install a bunch of dependencies mostly python stuff

RUN apt-get install -y  python-software-properties \
						git-core \
						python-dev \
						python-all-dev \
						python-setuptools \
						libapache2-mod-wsgi \
						build-essential \
						python-pip \
						nginx \
						libxml2-dev \
						libxslt1-dev \
						libjpeg-dev \
						mercurial \
						python-docutils \
						poppler-utils \
						python-markdown \
						python-yaml \
						python-openid \
						python-beautifulsoup \
						python-dateutil \
						antiword 


#Install pip and virtualenv

RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv

#Install Postgresql and postgis

RUN apt-get install -y  postgresql \
						postgresql-client \
						postgresql-contrib \
						pgadmin3 \
						postgis \
						postgresql-9.3-postgis-2.1


#Install gdal

RUN apt-get install -y  libgdal1-dev \
						python-gdal \
						gdal-bin

#Install elasticsearch

RUN apt-get install -y openjdk-7-jre-headless
RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb
RUN dpkg -i elasticsearch-1.2.1.deb
RUN service elasticsearch start

#Get the pombola code

RUN mkdir pombola_root && cd pombola_root
RUN git clone https://github.com/mysociety/pombola.git


#more instructions to follow........

