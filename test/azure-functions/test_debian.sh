#!/bin/bash

set -euo pipefail

. ./dev-container-features-test-lib
. ./common.sh

check "azure-functions-core-tools-v4 installed" dpkg_package_installed azure-functions-core-tools-v4

reportResults
