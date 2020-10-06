FROM ruby:2.5.1-alpine

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
  linux-headers \
  git \
  postgresql-dev \
  nodejs \
  tzdata

RUN apk add --no-cache --update util-linux bash readline readline-dev
# Install Libv8
RUN gem install libv8-alpine

# Set timezone
RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
RUN echo "America/Sao_Paulo" >  /etc/timezone

RUN apk add openssh
RUN apk add --update ruby-nokogiri

# Install phantom js
ENV PHANTOMJS_VERSION 2.1.1

RUN apk add --update --no-cache curl
RUN curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/${PHANTOMJS_VERSION}/dockerized-phantomjs.tar.gz" | tar xz -C /
RUN curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 | tar -jxvf - -C /
RUN cp phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN rm -fR phantomjs-${PHANTOMJS_VERSION}-linux-x86_64
RUN apk del curl

RUN mkdir /usr/src/app
COPY . /usr/src/app

WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/Gemfile
COPY Gemfile.lock /usr/src/app/Gemfile.lock
ENV BUNDLE_PATH /gems
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
