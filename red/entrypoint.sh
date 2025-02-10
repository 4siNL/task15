#!/bin/sh

envsubst '$PORT' < /etc/nginx/conf.d/red.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"
