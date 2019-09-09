FROM ruby:2.6.3-alpine

WORKDIR /app

COPY Gemfile* ./
RUN bundle install

COPY . .
