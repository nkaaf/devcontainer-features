#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "Cache not deleted" apt_like_cache_exists

reportResults
