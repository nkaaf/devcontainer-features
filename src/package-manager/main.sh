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

exec_tlmgr() {
    if [ "$PACKAGES" != "" ]; then
        tlmgr install $PACKAGES
    fi
    if [ "$UPGRADEPACKAGES" = "true" ]; then
        tlmgr update --self --all
    fi
    if [ "$DELETECACHE" = "true" ]; then
        echo "The option 'deleteCache' is not available for 'tlmgr' and will result in no action."
    fi
}

case "$MANAGER" in
    apt)
        exec_apt_like apt
        ;;
    apt-get)
        exec_apt_like apt-get
        ;;
    tlmgr)
        exec_tlmgr
        break
        ;;
    *)
        echo "Unknown package manager: '$MANAGER'"
        exit 1
        ;;
esac
