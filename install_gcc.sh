#!/bin/bash
cd /tmp

# Set internal DNS server
source setup_internal_dns.sh

# Download Xcode Command Line Tools
curl -O xcode-clt.dmg http://idev/xcode452cltools10_86938211a.dmg

# Mount image
hdid xcode-clt.dmg

# Install 
# TODO: loosen dependence on path/pkg name
sudo /usr/sbin/installer -verbose -pkg "/Volumes/Command Line Tools (Mountain Lion)/Command Line Tools (Mountain Lion).mpkg" -target /

# Cleanup
# find where mounted
mountPoint=$(mount | grep "Command Line Tools" | egrep -o ^[^[:space:]]+ )

# unmount
hdiutil detach $mountPoint -force

# remove
rm xcode-clt.dmg
