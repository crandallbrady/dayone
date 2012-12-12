#!/bin/bash
# Setup internal DNS so you can download Xcode from internal server
dns="192.168.86.200 8.8.8.8 8.8.4.4"

# set dns server instead of ...
# ... opening system preferences, going into network, selecting device, going to advance, typing it in, oking and applying
sudo networksetup -setdnsservers Ethernet $dns
sudo networksetup -setdnsservers Wi-Fi $dns

# test if internal dns is resolving properly before continuing
ping -c 1 idev
# ping error goes to sterr with no stout so testing for that
if [ $? -ne 0 ]; then
  echo "DNS did take :( better go talk to someone before continuing"
  return 1;
fi
