FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn npm

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile

COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
RUN npm install --global yarn
COPY . /app
