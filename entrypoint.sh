#!/bin/bash
set -e

bundle check || bundle install

while ! pg_isready -h postgres -p 5432 -q -U chat_server; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

if bundle exec rake db:exists; then
  bundle exec rake db:migrate
else
  bundle exec rake db:create
  bundle exec rails db:migrate
fi

pidfile='/app/tmp/pids/server.pid'

if [ -f $pidfile ] ; then
	echo 'Server PID file already exists. Removing it...'
	rm $pidfile
fi

bundle exec puma -C config/puma.rb
