FROM ruby:3.0.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY Gemfile /app/Gemfile

COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

COPY ./entrypoints/docker-entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["entrypoints/docker-entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]