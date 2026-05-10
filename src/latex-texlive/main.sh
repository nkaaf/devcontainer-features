#!/usr/bin/env sh

set -eu

. ./common.sh

profile=""
profile_path=./profile-install-tl

install_documentation_arg=""
if [ "$INSTALLDOCUMENTATION" = "false" ]; then
    if year_min 2023; then
        install_documentation_arg="-no-doc-install"
    else
        profile="tlpdbopt_install_docfiles 0
$profile"
    fi
fi

install_source_arg=""
if [ "$INSTALLSOURCE" = "false" ]; then
    if year_min 2023; then
        install_source_arg="-no-src-install"
    else
        profile="tlpdbopt_install_srcfiles 0
$profile"
    fi
fi

interaction_arg="-no-gui"
if year_min 2023; then
    interaction_arg="-no-interaction"
fi

repository_arg=""
if ! year_min "$(date +%Y)"; then
    repository_arg="-repository https://texlive.info/historic/systems/texlive/$YEAR/tlnet-final"
fi

cd /tmp
curl --location https://texlive.info/historic/systems/texlive/$YEAR/install-tl-unx.tar.gz --output ./install-tl-unx.tar.gz
tar --extract --file ./install-tl-unx.tar.gz
echo "$profile" > "$profile_path"
perl ./install-tl-*/install-tl $interaction_arg -no-persistent-downloads $install_documentation_arg $install_source_arg $repository_arg -profile "$profile_path" -scheme "scheme-$SCHEME"
rm --recursive "$profile_path" ./install-tl-*

arch=$(uname -m)
os_name=$(uname -s | tr '[:upper:]' '[:lower:]')
installation_path="/usr/local/texlive/$YEAR/bin/$arch-$os_name"
for f in "$installation_path"/*; do
    [ -f "$f" ] || continue
    name=$(basename "$f")
    ln --symbolic --force "$f" "/usr/local/bin/$name"
done

if [ "$PACKAGES" != "" ]; then
    tlmgr install $PACKAGES
    tlmgr path add
fi
