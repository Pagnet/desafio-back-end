#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

exec "$@"