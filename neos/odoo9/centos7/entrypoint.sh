#!/bin/bash

set -e

# set odoo database host, port, user and password
: ${PGHOST:=$DB_PORT_5432_TCP_ADDR}
: ${PGPORT:=$DB_PORT_5432_TCP_PORT}
: ${PGUSER:=${DB_ENV_POSTGRESQL_USER:='postgres'}}
: ${PGPASSWORD:=$DB_ENV_POSTGRESQL_PASSWORD}
export PGHOST PGPORT PGUSER PGPASSWORD

case "$1" in
	--)
		shift
		exec openerp-server "$@"
		;;
	-*)
		exec openerp-server "$@"
		;;
	*)
		exec "$@"
esac

exit 1
