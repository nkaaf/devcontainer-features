#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "Cache deleted" cache_exists
check "Upgrades not existing" upgrades_not_existing

reportResults
