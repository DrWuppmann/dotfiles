#!/usr/bin/env bash
# System Setup Script

# Fetching some Variables
SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname $SCRIPT)

createi3Config ()
{# Copy Config and add specific config
mkdir -p ~/.config/i3
cp ${BASEDIR}/resources/config/i3/i3.mars ~/.config/i3/config

}

createPolybarConfig ()
{
	# Copy Base File and Launch Script

}

vimSetup ()
{	
	#Copy Config
	cp ${BASEDIR}/resources/config/vimrc ~/.vimrc
	#Setup Pathogen Plugin Manager
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.po/pathogen.vim
	# Install Plugins
	cd ~/.vim/bundle
	for plugin in $(cat ${BASEDIR}/resources/aux/vim-plugins.txt); do
		git clone "https://github.com/${plugin}";
	done
	cd ${BASEDIR}
}

#Install Dependencies
echo "Installing pacaur..."
#source ${BASEDIR}/resources/aux/pacaur-setup.sh

echo "Installing Dependencies via pacaur..."
pacaur --needed --no-confirm -S - < "$(BASEDIR)/resources/aux/dependencies.pkg"

echo "Copying xinitrc..."
#cp ${BASEDIR}/resources/config/xinitrc ~/.xinitrc
echo "Copying bash Config..."
#cp ${BASEDIR}/resources/config/bashrc ~/.bashrc
echo "Copying zsh Config..."
#cp ${BASEDIR}/resources/config/zshrc ~/.zshrc
echo "Creating dunst config directory..."
#mkdir -p ~/.config/dunst/
echo "Copying Dunst Config..."
#cp ${BASEDIR}/resources/config/dunstrc ~/.config/dunst/dunstrc

createAliases
createi3Config
createPolybarConfig
createRangerConfig
vimSetup

# Copy Display Scripts

# System Reboot

echo "Finished!"
