#!/bin/sh

set -e

bundle config unset without
bundle config set path 'vendor/bundle'

bundle check || bundle install --path vendor/bundle

rm -f tmp/pids/server.pid

exec bundle exec "$@"