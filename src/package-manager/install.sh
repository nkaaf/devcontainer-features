#!/usr/bin/env sh

set -eu

if [ "$(id -u)" -ne 0 ]; then
    echo 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

if [ "$MANAGER" = "system" ]; then
    if [ -f /etc/os-release ]; then
        . /etc/os-release

        case "$ID" in
            ubuntu|debian)
                MANAGER="apt-get"
                ;;
            *)
                echo "Currently the OS '$ID' is not supported. Please request the feature."
                exit 1
                ;;
        esac
    else
        echo "Cannot detect OS: /etc/os-release not found. Please request the feature."
        exit 1
    fi
fi

if ! command -v "$MANAGER" > /dev/null 2>&1; then
    echo "Package Manager $MANAGER is not installed or available."
    exit 1
fi

sh "$(dirname $0)/main.sh"
exit $?
