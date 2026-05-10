#!/usr/bin/env sh

set -eu

tlmgr_package_installed() {
    installed=$(tlmgr info "$1" | grep "installed:" | cut --delimiter ':' --fields 2 | xargs)
    [ "$installed" = "Yes" ]
}

if [ "$PACKAGES" != "" ]; then
    tlmgr install $PACKAGES
    for package in $PACKAGES; do
        if ! tlmgr_package_installed "$package"; then
            echo "Package '$package' cannot be installed"
            exit 1
        fi
    done
fi
if [ "$UPGRADEPACKAGES" = "true" ]; then
    tlmgr update --self --all
fi
