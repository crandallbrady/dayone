#!/bin/bash
# Install Xcode Command Line Tools from internal server

# Set internal DNS server
source setup_internal_dns.sh

# Download Xcode Command Line Tools
curl -o xcode-clt.dmg http://idev/xcode452cltools10_86938211a.dmg

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

# system looks for gcc at /usr/bin
echo "We need to link the newly installed gcc-4.2 into your system. Please authenticate for sudo..."
sudo ln -s /usr/local/bin/gcc-4.2 /usr/bin/gcc-4.2
