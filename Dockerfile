FROM ruby:2.7.1-slim

ENV BUNDLER_VERSION=2.1.4

RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y curl gnupg && \
    apt-get install -y postgresql-client && \
    apt-get install -y build-essential && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash && \
    apt-get install -y nodejs libpq-dev && \
    apt-get -y clean && \
    find /var/lib/apt/lists/ -type f -exec rm -f {} \;

ENV INSTALL_PATH /backend_challenge

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v $BUNDLER_VERSION

RUN npm install -g yarn

COPY package.json ./

RUN bundle check || bundle install --jobs 20 --retry 5 && \
    yarn install

COPY . .
