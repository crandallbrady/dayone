#!/bin/bash
# Setup internal DNS so you can download Xcode from internal server
dns="192.168.1.200 8.8.8.8 8.8.4.4"

echo "Are you connected via WiFi? (y/n)"
read wifi
if [ "$wifi" == "y" ]; then
    service="Wi-Fi"
else
    echo "Are you using Ethernet? (y/n)"
    read eth
    if [ "$eth" == "y" ]; then
        service="Ethernet"
    else
        echo "Get online and re-run this script"
        exit;
    fi
fi

# set dns server instead of ...
# opening system preferences, going into network, selecting device, going to advance, typing it in, oking and applying
sudo networksetup -setdnsservers $service $dns
