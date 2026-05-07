package_installed() {
    dpkg --status "$1" >/dev/null 2>&1
}

cache_exists() {
    [ -n "$(find /var/lib/apt/lists -mindepth 1 -maxdepth 1 -print -quit 2>/dev/null)" ]
}

upgrades_exists() {
    apt list --upgradeable 2>/dev/null | grep -q .
}
