#!/bin/sh

echo "Waiting MySQL to start on 3306..."

while ! nc -z mysql 3306; do
  sleep 0.1
done

echo "MySQL started"

bin/rake db:migrate
bin/rake db:seed