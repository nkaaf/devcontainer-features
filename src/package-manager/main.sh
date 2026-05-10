#!/usr/bin/env sh

set -eu

exec_apt_like() {
    local command=$1

    if [ "$command" = "apt" ] && [ "$command" = "apt-get" ]; then
        echo "Internal error: Incorrect usage, command is: '$command'."
        return 1
    fi

    $command update

    if [ "$PACKAGES" != "" ]; then
        $command --yes --no-install-recommends install $PACKAGES
    fi
    if [ "$UPGRADEPACKAGES" = "true" ]; then
        $command --yes upgrade
    fi
    if [ "$DELETECACHE" = "true" ]; then
        $command clean
        rm -rf /var/lib/apt/lists/*
    fi
}

case "$MANAGER" in
    apt)
        exec_apt_like apt
        ;;
    apt-get)
        exec_apt_like apt-get
        ;;
    *)
        echo "Internal error: Unknown package manager: '$MANAGER'"
        exit 1
        ;;
esac
