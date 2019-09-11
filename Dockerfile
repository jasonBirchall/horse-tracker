FROM ruby:latest

ENV \
  OPENSSL_CONF=/etc/ssl \
  PHANTOMJS_VERSION=2.1.1

WORKDIR /app

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 \
         && tar xvjf phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 -C /usr/local/share/ \
         && ln -sf /usr/local/share/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin 

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .
