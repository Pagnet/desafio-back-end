FROM ruby:2.7.0

WORKDIR /app

RUN rm -rf *.lock
RUN rm -rf node_modules/*

COPY Gemfile* ./

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    nodejs \
    yarn=1.17.3-1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f tmp/pids/server.pid && \
    gem install foreman

RUN gem update --system
RUN gem update bundler
RUN bundle install

COPY . /app

RUN yarn install

RUN chown -R $USER:$USER **
RUN chmod 777 bin/**

RUN bin/webpack --css-loader

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
