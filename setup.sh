#!/usr/bin/env bash
# System Setup Script

# Fetching some Variables
SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname $SCRIPT)

createAliases ()
{
echo "Adding shortcuts to Aliases..."
#cp ${BASEDIR}/resources/config/aliases.base ~/.aliases
while read -r line || [[ -n "$line" ]]; do
	echo "Line: $line"
done < "${BASEDIR}/resources/aux/shortcuts.txt"
}

createi3Config ()
{# Copy Config and add specific config
mkdir -p ~/.config/i3
cp ${BASEDIR}/resources/config/i3/i3.base ~/.config/i3/config
cat ${BASEDIR}/resources/config/i3/i3.

}

createPolybarConfig ()
{# Copy Base File and Launch Script

}

createRangerConfig ()
{# Copy Base Config


# Add shortcuts from files
}

vimSetup ()
{
# Copy Config

# Install Plugins
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
