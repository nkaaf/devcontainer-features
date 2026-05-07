#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" package_installed sl
check "cowsay deleted" package_installed cowsay
check "Cache deleted" bash -c '! cache_exists'
check "Upgrades not existing" bash -c '! upgrades_exists'

reportResults
