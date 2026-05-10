#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" dpkg_package_installed sl
check "Cache deleted" apt_like_cache_exists

reportResults
