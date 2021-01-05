#!/bin/sh -e

sleep 2

/app/migrate.linux-amd64 -source file://app -database $DB_CONN_STR up

exec /app/main
