#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "tlmgr package latexmk installed" tlmgr_package_installed "latexmk"
check "tlmgr package latexmk executable" command -v latexmk &>/dev/null

reportResults
