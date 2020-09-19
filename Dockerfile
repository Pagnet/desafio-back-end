FROM ruby:2.7.1-slim

ENV BUNDLER_VERSION=2.1.4

RUN apt-get update && apt-get install -y curl gnupg && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential nodejs libpq-dev apt-utils

ENV INSTALL_PATH /backend_challenge

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v $BUNDLER_VERSION

RUN npm install -g yarn

COPY package.json yarn.lock ./

RUN bundle check || bundle install --jobs 20 --retry 5 && \
    yarn install
COPY . .
