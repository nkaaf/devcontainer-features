#!/usr/bin/env sh

set -eu

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

sh "$(dirname $0)/main.sh"
exit $?
