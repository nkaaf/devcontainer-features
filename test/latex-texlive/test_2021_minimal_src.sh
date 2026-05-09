#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "TeX Live installed" texlive_installed
check "TeX Live version" texlive_version "2021"
check "TeX Live scheme" tlmgr_package_installed "scheme-minimal"
check "Documentation not installed" docfiles_not_installed
check "Source installed" srcfiles_installed

reportResults
