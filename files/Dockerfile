FROM centos:7

MAINTAINER Eduardo Dicarte "eduardo_dicarte@yahoo.com.br"

RUN yum install -y -q wget git-core rubygems 
RUN gem install --no-ri --no-rdoc puppet librarian-puppet

RUN mkdir /puppet
WORKDIR   /puppet

ADD site.pp /puppet/site.pp
ADD Puppetfile /puppet/Puppetfile

RUN librarian-puppet install 
RUN puppet apply --modulepath=/puppet/modules site.pp