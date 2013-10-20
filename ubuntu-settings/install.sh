#! /usr/bin/env bash

#1. two finger scroll fix 
cd $HOME
if [ ! -d ./.config/autostart ]; then
	mkdir $(pwd)/.config/autostart
fi

cd $HOME/dotfiles/ubuntu-settings
ln -sf $(pwd)/synaptics-two-finger-scroll.desktop $HOME/.config/autostart/synaptics-two-finger-scroll.desktop

#2. bluetooth off by default
sudo sed -i 's/InitiallyPowered = true/InitiallyPowered = false/' /etc/bluetooth/main.conf

#3. Import gnome-terminal settings with gconftool-2
# just copying the XML config will will not work
gconftool-2 --load gnome-terminal.xml
