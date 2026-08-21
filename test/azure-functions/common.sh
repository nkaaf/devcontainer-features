dpkg_package_installed() {
    dpkg --status "$1" >/dev/null 2>&1
}
