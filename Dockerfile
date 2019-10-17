FROM ruby:2.6.3

RUN apt-get update -qq \
    && apt-get install -y \
        build-essential libpq-dev libnss3-dev nodejs \
        postgresql postgresql-client \
        netcat

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs && npm install --global yarn

RUN npm config get registry prints: https://registry.npmjs.org

ENV src ./src
COPY $src/Gemfile* /tmp/
WORKDIR /tmp
RUN gem install bundler
RUN bundle install

ENV app /app
RUN mkdir $app
WORKDIR $app

# Copy the main application.
COPY $src ./

# Precompile Rails assets
RUN bundle exec rake assets:precompile

EXPOSE 3000

RUN chmod +x $app/bin/entrypoint.sh
CMD $app/bin/entrypoint.sh
