#!/usr/bin/env sh

set -eu

exec_apt_like() {
    local command=$1

    if [ "$command" = "apt" ] && [ "$command" = "apt-get" ]; then
        echo "Internal error: Incorrect usage, command is: '$command'."
        return 1
    fi

    $command update
    $command --yes --no-install-recommends install $PACKAGES

    if [ "$UPGRADEPACKAGES" -eq "true" ]; then
      $command --yes upgrade  
    fi
    if [ "$DELETECACHE" -eq "true" ]; then
        $command clean
        rm -rf /var/lib/apt/lists/*
    fi
}

case "$MANAGER" in
    apt)
        exec_apt_like apt
        break
        ;;
    apt-get)
        exec_apt_like apt-get
        break
        ;;
    *)
        echo "Unknown package manager: '$MANAGER'"
        exit 1
        ;;
esac
