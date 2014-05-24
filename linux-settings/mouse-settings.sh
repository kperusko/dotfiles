#!/bin/bash

case "$1" in
	post)
	su kristijan -c "export DISPLAY=:0.0 ; sleep 3 ; /home/kristijan/dotfiles/linux-settings/synaptics-two-finger-scroll.sh"
;;
esac
