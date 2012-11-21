#!/bin/bash
# Install Sprintly-GitHub tool
# https://github.com/nextbigsoundinc/Sprintly-GitHub

# download
curl -O https://raw.github.com/nextbigsoundinc/Sprintly-GitHub/master/sprintly

# install
sudo python sprintly --install

# clean up
rm sprintly

# setup
echo "Setup Sprint.ly now? (y/n)"
read REPLY
if [ "$REPLY" == "y" ]; then
    echo "Open Sprint.ly profile to get API key? (y/n)"
    read PROFILE
    [ "$PROFILE" == "y" ] && open https://sprint.ly/account/profile
    sprintly
    # will prompt for sprint.ly username (email), sprint.ly API key, and default product id
fi

