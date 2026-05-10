#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "TeX Live installed" texlive_installed
check "TeX Live scheme" tlmgr_package_installed "scheme-minimal"
check "Documentation not installed" docfiles_not_installed
check "Source not installed" srcfiles_not_installed
check "tlmgr package latexmk executable" command -v latexmk &>/dev/null

reportResults
