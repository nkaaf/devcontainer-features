#!/usr/bin/env sh

set -eu

if ! command -v tlmgr > /dev/null 2>&1; then
    echo "Package Manager 'tlmgr' is not available."
    exit 1
fi

sh "$(dirname $0)/main.sh"
exit $?
