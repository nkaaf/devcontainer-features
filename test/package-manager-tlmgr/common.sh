tlmgr_package_installed() {
    installed=$(tlmgr info "$1" | grep "installed:" | cut --delimiter ':' --fields 2 | xargs)
    [ "$installed" = "Yes" ]
}
