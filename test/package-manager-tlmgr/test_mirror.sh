#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "tlmgr package xcolor installed" tlmgr_package_installed "xcolor"

reportResults
