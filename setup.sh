#!/usr/bin/env bash
# System Setup Script

# Fetching some Variables
SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname $SCRIPT)

# i3 config
echo "Copying i3 config..."
mkdir -p ~/.config/i3
ln ${BASEDIR}/resources/config/i3/config.mars ~/.config/i3/config



# vim config
echo "Copying vim config..."
ln ${BASEDIR}/resources/config/vimrc ~/.vimrc

#Setup Pathogen Plugin Manager
echo "Setting up vim pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.po/pathogen.vim

# Install Plugins
echo "Installing Plugins..."
cd ~/.vim/bundle
for plugin in $(cat ${BASEDIR}/resources/aux/vim-plugins.txt); do
	git clone "https://github.com/${plugin}";
done
cd ${BASEDIR}

#Install Dependencies
echo "Installing pacaur..."
source ${BASEDIR}/resources/aux/pacaur-setup.sh

# Installing packages
echo "Installing Dependencies via pacaur..."
pacaur --needed --no-confirm -S - < "${BASEDIR}/resources/aux/deps"
echo "Installing base packages..."
pacaur --needed --no-confirm -S - < "${BASEDIR}/resources/aux/base"
echo "Installing system specific packages..."
pacaur --needed --no-confirm -S - < "${BASEDIR}/resources/aux/mars.pkg"

# Other config files
echo "Copying xinitrc..."
ln ${BASEDIR}/resources/config/xinitrc ~/.xinitrc
echo "Copying bash Config..."
ln ${BASEDIR}/resources/config/bashrc ~/.bashrc
echo "Copying zsh Config..."
ln ${BASEDIR}/resources/config/zshrc ~/.zshrc
echo "Copying Dunst Config..."
mkdir -p ~/.config/dunst/
ln ${BASEDIR}/resources/config/dunstrc ~/.config/dunst/dunstrc

echo "Finished!"
