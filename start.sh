#!/bin/sh

set -e

echo "run db migration"
source /app/app.env
/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up


echo "start the app"
#It basically means: takes all parameters passed to the script and run it.
exec "$@"