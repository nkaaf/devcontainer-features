#!/usr/bin/env sh

set -eu

install_documentation_arg=""
if [ "$INSTALLDOCUMENTATION" = "false" ]; then
    install_documentation_arg="-no-doc-install"
fi

install_source_arg=""
if [ "$INSTALLSOURCE" = "false" ]; then
    install_source_arg="-no-src-install"
fi

cd /tmp
curl --location https://texlive.info/historic/systems/texlive/$YEAR/install-tl-unx.tar.gz --output ./install-tl-unx.tar.gz
tar --extract --file ./install-tl-unx.tar.gz
perl ./install-tl-*/install-tl -no-interaction -no-persistent-downloads $install_documentation_arg $install_source_arg -scheme "scheme-$SCHEME"
rm --recursive ./install-tl-*

arch=$(uname -m)
os_name=$(uname -s | tr '[:upper:]' '[:lower:]')
installation_path="/usr/local/texlive/$YEAR/bin/$arch-$os_name"

for f in "$installation_path"/*; do
    [ -f "$f" ] || continue
    name=$(basename "$f")
    ln -sf "$f" "/usr/local/bin/$name"
done

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

if [ "$PACKAGES" != "" ]; then
    tlmgr install $PACKAGES
fi
