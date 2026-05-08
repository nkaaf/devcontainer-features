texlive_installed() {
    command -v tex >/dev/null 2>&1
}

texlive_not_installed() {
    ! texlive_installed
}

texlive_version() {
    texlive_version=$(tex --version | head --lines 1 | cut --delimiter ' ' --fields=5 | rev | cut -c2- | rev)
    [ "$texlive_version" = "$1" ]
}

tlmgr_package_installed() {
    installed=$(tlmgr info "$1" | grep "installed:" | cut --delimiter : --fields 2 | xargs)
    [ "$installed" = "Yes" ]
}

docfiles_installed() {
    installed=$(tlmgr option show | grep docfiles | cut --delimiter ':' --fields 2 | xargs)
    [ "$installed" = "1" ]
}

docfiles_not_installed() {
    ! docfiles_installed
}

srcfiles_installed() {
    installed=$(tlmgr option show | grep srcfiles | cut --delimiter ':' --fields 2 | xargs)
    [ "$installed" = "1" ]
}

srcfiles_not_installed() {
    ! srcfiles_installed
}
