FROM ruby:latest
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /pagnet
WORKDIR /pagnet
COPY Gemfile /pagnet/Gemfile
COPY Gemfile.lock /pagnet/Gemfile.lock
RUN bundle install
COPY . /pagnet

# Add a script to be executed every time the container starts.
COPY ./docker/app/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
