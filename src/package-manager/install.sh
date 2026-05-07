#!/usr/bin/env sh

set -eu

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if ! command -v "$MANAGER" > /dev/null 2>&1; then
    echo "Package Manager $MANAGER is not installed or available."
    exit 1
fi

sh "$(dirname $0)/main.sh"
exit $?
