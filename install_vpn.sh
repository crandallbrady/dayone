#!/bin/bash
# Install Tunnelblick and setup VPN

# download
curl -o tunnelblick.dmg -L http://tunnelblick.googlecode.com/files/Tunnelblick_3.3beta21a.dmg

# mount and install
hdid tunnelblick.dmg
open /Volumes/Tunnelblick/Tunnelblick.app
# will prompt for password and say it installed...

# pausing script
echo "Are you finished installing Tunnelblick? (y/n)"
read yes

# find where mounted
mountPoint=$(mount | grep Tunnelblick | egrep -o ^[^[:space:]]+ )

# unmount
hdiutil detach $mountPoint -force

# remove
rm tunnelblick.dmg

# copy configuration files in place
scp idev:openvpn-config/* ~/Library/Application\ Support/Tunnelblick/Configurations/

