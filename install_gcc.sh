#!/bin/bash
cd /tmp

# Download Xcode Command Line Tools
# TODO: host internally, not behind AAPL wall or on GH where blog is too big
# curl -O xcode-clt.dmg https://isocket.lan/xcode452cltools10_86938211a.dmg

# Mount image
hdid xcode-clt.dmg

# Install 
# TODO: loosen dependence on path/pkg name
sudo /usr/sbin/installer -verbose -pkg "/Volumes/Command Line Tools (Mountain Lion)/Command Line Tools (Mountain Lion).mpkg" -target /

# Cleanup
# find where mounted
mountPoint=$(mount | grep Command | egrep -o ^[^[:space:]]+ )

# unmount
hdiutil detach $mountPoint -force

# remove
rm xcode-clt.dmg
