#!/bin/bash
# set global configs related to git

# get user info if being run as standalone script
source user_prompt.sh

git config --global user.name "$user_name"
git config --global user.email "$user_email"
# password caching
git config --global credential.helper osxkeychain

# copy public key to clipboard
pbcopy < ~/.ssh/id_rsa.pub
echo "Your public key is copied to your clipboard."

# GitHub setup
echo "Open GitHub to finish setting up? (y/n)"
read REPLY
if [ "$REPLY" == "y" ]; then
    open https://github.com/settings/ssh
    echo "Test GitHub setup? (y/n)"
    read REPLY
    [ "$REPLY" == "y" ] && ssh -T git@github.com
fi

