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