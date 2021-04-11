#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid

bundle exec rails s -b 0.0.0.0