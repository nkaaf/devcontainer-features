#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" package_installed sl
check "Cache deleted" cache_exists
check "Upgrades exists" upgrades_exists

reportResults
