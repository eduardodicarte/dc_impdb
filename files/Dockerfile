FROM debian:jessie

MAINTAINER Eduardo Dicarte "eduardo_dicarte@yahoo.com.br"

ADD sources.list /etc/apt/sources.list

RUN apt-get -y update 
RUN apt-get -y -q install wget git-core rubygems 
RUN gem install --no-ri --no-rdoc puppet librarian-puppet

RUN mkdir /puppet
WORKDIR   /puppet

ADD site.pp /puppet/site.pp
ADD Puppetfile /puppet/Puppetfile

RUN librarian-puppet install 
RUN puppet apply site.pp