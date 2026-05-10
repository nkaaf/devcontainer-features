#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" dpkg_package_installed sl
check "cowsay installed" dpkg_package_installed cowsay
check "Cache not deleted" apt_like_cache_exists

reportResults
