#!/bin/sh

# simple script for starting vmware services manually
# when running the vmware player
# script permissions should be 4750 
# and owner should be root:wheel

# start the services
sudo service vmware start

# start the player
/usr/bin/vmplayer
