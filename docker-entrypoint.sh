#!/bin/bash

set -e

# Add as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- ./certbot-auto "$@"
fi

exec "$@"
