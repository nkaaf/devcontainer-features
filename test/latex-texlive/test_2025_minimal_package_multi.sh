#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "TeX Live installed" texlive_installed
check "TeX Live version" texlive_version "2025"
check "TeX Live scheme" tlmgr_package_installed "scheme-minimal"
check "tlmgr package xifthen installed" tlmgr_package_installed "xifthen"
check "tlmgr package ifmtarg installed" tlmgr_package_installed "ifmtarg"
check "Documentation not installed" docfiles_not_installed
check "Source not installed" srcfiles_not_installed

reportResults
