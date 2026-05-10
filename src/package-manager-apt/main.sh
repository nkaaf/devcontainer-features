#!/usr/bin/env sh

set -eu

command=$MANAGER

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