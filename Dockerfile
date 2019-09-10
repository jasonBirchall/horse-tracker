FROM ruby:latest

ENV OPENSSL_CONF=/etc/ssl
WORKDIR /app

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
         && tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/ \
         && ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin 
#  https://tecadmin.net/install-phantomjs-on-centos/

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
