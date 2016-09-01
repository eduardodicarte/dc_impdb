FROM centos:7

MAINTAINER Eduardo Dicarte "eduardo_dicarte@yahoo.com.br"

RUN yum update -y
RUN yum install rubygems -y
RUN gem install --no-ri --no-rdoc puppet

RUN mkdir /puppet
WORKDIR /puppet
#ADD site.pp /puppet/site.pp
