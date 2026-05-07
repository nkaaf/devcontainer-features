#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" package_installed sl
check "cowsay deleted" package_installed cowsay
check "Cache not deleted" cache_exists
check "Upgrades exists" upgrades_exists

reportResults
