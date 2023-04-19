#!/bin/sh
# wait-for-postgres.sh

HOST="$1"
PORT="$2"
USER="$3"
PASS="$4"

until PGPASSWORD=$PASS psql -h $HOST -p $PORT -U $USER -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
