dpkg_package_installed() {
    dpkg --status "$1" >/dev/null 2>&1
}

apt_like_cache_exists() {
    find /var/lib/apt/lists -mindepth 1 -maxdepth 1 -print -quit 2>/dev/null | read
}

apt_like_cache_deleted() {
    ! apt_like_cache_exists
}
