#!/bin/bash

set -eu

. ./dev-container-features-test-lib
. ./common.sh

check "Cache deleted" apt_like_cache_deleted

reportResults
