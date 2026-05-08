#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "TeX Live not installed" texlive_not_installed
check "TeX Live scheme" tlmgr_package_installed "scheme-infraonly"
check "Documentation not installed" docfiles_not_installed
check "Source not installed" srcfiles_not_installed

reportResults
