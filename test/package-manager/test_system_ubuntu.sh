#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "sl installed" package_installed sl

reportResults
