#!/usr/bin/env sh

set -eu

. ./common.sh

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ "$SCHEME" = "bookpub" ] && ! year_min 2021; then
    echo "Current selected year is '$YEAR', but the scheme 'bookpub' exists since 2021"
    exit 1
fi

sh "$(dirname $0)/main.sh"
exit $?
