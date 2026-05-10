#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "tlmgr package xifthen installed" tlmgr_package_installed "xifthen"
check "tlmgr package ifmtarg installed" tlmgr_package_installed "ifmtarg"

reportResults
