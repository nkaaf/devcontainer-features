#!/usr/bin/env sh

set -eu

year_min() {
    [ "$YEAR" -ge $1 ]
}

export_path() {
    arch=$(uname -m)
    os_name=$(uname -s | tr '[:upper:]' '[:lower:]')
    installation_path="/usr/local/texlive/$YEAR/bin/$arch-$os_name"

    for f in "$installation_path"/*; do
        [ -f "$f" ] || continue
        name=$(basename "$f")
        ln -sf "$f" "/usr/local/bin/$name"
    done
}

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
        install_documentation_arg="-no-doc-install"
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

# Everything below is unfortunately not working :(
#[ -f "/root/.profile" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "/root/.profile"
#[ -f "/root/.bashrc" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "/root/.bashrc"
#[ -f "/root/.zshrc" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "/root/.zshrc"
#[ -f "/root/.oh-my-zsh" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "/root/.oh-my-zsh"
#[ -f "/root/.zprofile" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "/root/.zprofile"
#[ -f "$_REMOTE_USER_HOME/.profile" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "$_REMOTE_USER_HOME/.profile"
#[ -f "$_REMOTE_USER_HOME/.bashrc" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "$_REMOTE_USER_HOME/.bashrc"
#[ -f "$_REMOTE_USER_HOME/.zshrc" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "$_REMOTE_USER_HOME/.zshrc"
#[ -f "$_REMOTE_USER_HOME/.oh-my-zsh" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "$_REMOTE_USER_HOME/.oh-my-zsh"
#[ -f "$_REMOTE_USER_HOME/.zprofile" ] && echo "export PATH=\"$installation_path:\$PATH\"" >> "$_REMOTE_USER_HOME/.zprofile"
#echo "export PATH=\"$installation_path:\$PATH\"" >> /etc/bash.bashrc
#echo "export PATH=\"$installation_path:\$PATH\"" >> /etc/zsh/zshrc
#echo "export PATH=\"$installation_path:\$PATH\"" >> /etc/profile
#echo "export PATH=\"$installation_path:\$PATH\"" > /etc/profile.d/texlive.sh
#chmod +x /etc/profile.d/texlive.sh

# Workaround for the failed exporting of the new PATH above
export_path

if [ "$PACKAGES" != "" ]; then
    tlmgr install $PACKAGES
fi

# Have to do it twice, so the installed packages can be linked too
export_path
