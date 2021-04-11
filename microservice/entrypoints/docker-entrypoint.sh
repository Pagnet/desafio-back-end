#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

bundle exec rails s -b 0.0.0.0