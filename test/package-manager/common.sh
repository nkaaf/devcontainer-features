package_installed() {
    dpkg --status "$1" >/dev/null 2>&1
}

cache_exists() {
    find /var/lib/apt/lists -mindepth 1 -maxdepth 1 -print -quit 2>/dev/null | read
}

cache_deleted() {
    ! cache_exists
}

upgrades_exists() {
    apt-get -s upgrade 2>&1 | grep -q '^Inst'
}

upgrades_not_existing() {
    ! upgrades_exists
}
