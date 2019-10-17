#!/bin/bash

wait_for() {
  host="$1"
  port="$2"
  while ! nc -z ${host} ${port}; do
    sleep 1
  done
}

wait_for postgres 5432
wait_for redis 6379

# Remove pids
/bin/rm -f /app/tmp/pids/server.pid \
           /app/tmp/pids/puma.pid

# Initialize Ruby on Rails
exec /app/bin/rails server -b 0.0.0.0 -p 3000