Global configuration settings for Ubuntu (tested on 13.10).
=================

1.	**Two finger scroll for Synaptics touchpad**

	For some reason two finger scrolling option is not enabled in the settings.
Script synaptics-two-finger-scroll.sh must be started on startup. It enables the 
two finger scroll (vert & horiz) and adjusts the scrolling speed.


2.	**Bluetooth off on startup**

	edit **/etc/bluetooth/main.conf**

    	 InitiallyPowered = false


