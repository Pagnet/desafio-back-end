FROM ruby:2.7.1-alpine3.12

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
  linux-headers \
  git \
  postgresql-dev \
  nodejs \
  nodejs-npm \
  tzdata

RUN apk add --no-cache --update util-linux bash readline readline-dev

# Install Libv8
RUN gem install libv8-alpine
# Set timezone
RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN echo "America/Sao_Paulo" >  /etc/timezone
RUN npm install -g yarn
RUN apk add --update ruby-nokogiri

RUN apk add --update --no-cache curl

RUN apk del curl

RUN mkdir /usr/src/app
COPY . /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
ENV BUNDLE_PATH /gems
RUN gem install bundler -v "1.17.3"
RUN gem install rubocop-performance rubocop-rails
RUN bundle config build.libv8 --with-system-v8
RUN bundle install --jobs "$(getconf _NPROCESSORS_ONLN)" --retry 5

# Add a script to be executed every time the container starts.
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["sh","start.sh"]
EXPOSE 3000

ENV TERM=dumb

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
