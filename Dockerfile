FROM aooj/base
MAINTAINER AooJ <aooj@n13.cz>

RUN apt-get update -q && apt-get upgrade -y
RUN apt-get -y install build-essential zlib1g zlib1g-dev libxml2 libxml2-dev libxslt-dev sqlite3 libsqlite3-dev locate git-core make && apt-get clean
RUN apt-get -y install gcc-4.4 && apt-get clean
WORKDIR /tmp

RUN curl http://cache.ruby-lang.org/pub/ruby/ruby-1.8.7-p358.tar.gz | tar -xzv
RUN curl http://production.cf.rubygems.org/rubygems/rubygems-1.3.5.tgz | tar -xzv

WORKDIR /tmp/ruby-1.8.7-p358
RUN export CFLAGS="-O2 -fno-tree-dce -fno-optimize-sibling-calls" && ./configure --disable-install-doc && make && make install

WORKDIR /tmp/rubygems-1.3.5
RUN ruby setup.rb install

RUN rm -rf /tmp/*
WORKDIR /
