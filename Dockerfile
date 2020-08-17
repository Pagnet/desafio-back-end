FROM ruby:2.7

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN rm -r /var/lib/apt/lists /var/cache/apt/archives && \
    apt-get update && apt-get upgrade -y

RUN apt-get install -y nodejs postgresql-client vim && \
    apt-get install -y yarn && \
    apt-get install -y imagemagick && \
    apt-get install -y libvips-tools && \
    apt-get install -y build-essential && \
    apt-get install -y ca-certificates && \
    apt-get install -y curl && \
    apt-get install -y git && \
    apt-get install -y gzip && \
    apt-get install -y imagemagick && \
    apt-get install -y sudo && \
    apt-get install -y tar && \
    apt-get install -y unzip && \
    apt-get install -y wget && \
    apt-get install -y locales

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ENV APP_PATH=/app

RUN mkdir $APP_PATH
WORKDIR $APP_PATH
COPY Gemfile "${APP_PATH}/Gemfile"
COPY Gemfile.lock "${APP_PATH}/Gemfile.lock"
COPY . /app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000" ]
