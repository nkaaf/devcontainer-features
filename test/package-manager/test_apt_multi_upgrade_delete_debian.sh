#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" package_installed sl
check "cowsay installed" package_installed cowsay
check "Cache deleted" cache_deleted
check "Upgrades not existing" upgrades_not_existing

reportResults
