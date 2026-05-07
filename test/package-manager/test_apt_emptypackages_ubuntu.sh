#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "Cache not deleted" cache_exists
check "Upgrades exists" upgrades_exists

reportResults
