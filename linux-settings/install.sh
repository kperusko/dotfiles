#! /usr/bin/env bash

#1. two finger scroll fix 
cd $HOME
if [ ! -d ./.config/autostart ]; then
	mkdir $(pwd)/.config/autostart
fi

cd $HOME/dotfiles/linux-settings
cp -f $(pwd)/synaptics-two-finger-scroll.desktop $HOME/.config/autostart/synaptics-two-finger-scroll.desktop
SED_EXPRESSION="s,HOME_PATH,$HOME,"
sed -i "$SED_EXPRESSION" $HOME/.config/autostart/synaptics-two-finger-scroll.desktop

#Add fix for the Fedora so that the two finger scroll script is executed on resume
if [ `lsb_release -s -i` = "Fedora" ]; then
	sudo cp $(pwd)/mouse-scroll.sh /usr/lib/systemd/system-sleep
fi

if [ `lsb_release -s -i` = "Ubuntu" ]; then
	#2. bluetooth off by default
	sudo sed -i 's/InitiallyPowered = true/InitiallyPowered = false/' /etc/bluetooth/main.conf

	#3. Import gnome-terminal settings with gconftool-2
	# just copying the XML config will will not work
	# configuration is just for Ubuntu
	gconftool-2 --load gnome-terminal.xml
fi

# if VMware player services are disabled
# use the vmware.sh script to start them when starting VMware player
# cp $(pwd)/vmware-player.desktop ~/.local/share/applications/vmware-player.desktop

# remove existing launcher if exists
# VMPLAYER_DESKTOP=/usr/share/applications/vmware-player.desktop
# if [ -f $VMPLAYER_DESKTOP ]; then
#     sudo rm $VMPLAYER_DESKTOP
# fi

