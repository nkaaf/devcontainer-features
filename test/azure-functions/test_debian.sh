#!/bin/bash

set -euo pipefail

. ./dev-container-features-test-lib
. ./common.sh

check "azure-functions-core-tools installed" dpkg_package_installed azure-functions-core-tools

reportResults
