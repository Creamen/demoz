#!/bin/sh

mkdir -p /run/postgresql
chown -R postgres:postgres /run/postgresql

su - postgres -c "pg_ctl status -D playground || pg_ctl start -D playground"
su - postgres -c "psql"

exit 0
