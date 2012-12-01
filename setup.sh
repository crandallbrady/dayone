#!/bin/bash
# This script installs everything you need to get started setting up a new machine

echo "We will be sudo-ing a lot so let's get that password out of the way..."
# from https://github.com/paulirish/dotfiles/blob/master/.osx#L5
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get basic info from user like name and email
source user_prompt.sh

# generate ssh key
source generate_ssh.sh

# if gcc is not installed, go download and install it
gcc -v
if [ "$?" -ne "0" ]; then
    echo "gcc not installed (CLT)"
    echo "if (when) the dmg mount window opens, ignore it and come back to Terminal"
    sleep 3
    # Install Command Line Tools
    source install_gcc.sh
else
    echo "gcc installed"
fi

# Install RVM
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm

# Install RubyGems
source install_rubygems.sh

# Install Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
brew doctor

# Install Git, bash completion, and hub (a GitHub tool)
brew install git bash-completion hub

# replace LLVM gcc for rvm
brew tap homebrew/dupes
brew install autoconf automake apple-gcc42
rvm pkg install openssl

# TODO: detect if could not link apple-gcc42 and run...
# sudo chown root:admin /usr/local/include/
# sudo chmod g+w /usr/local/include
# brew link apple-gcc42

# Set global configs for git
source git_config.sh

# Install Pygments for syntax highlighting
sudo easy_install Pygments

# Install PEAR
source install_pear.sh

#Install Chef
#sudo gem install chef --no-ri --no-rdoc

# Install dotfiles (optional)
echo "Install dotfiles by maxbeatty? (y/n)"
read REPLY
[ "$REPLY" == "y" ] && hub clone maxbeatty/dotfiles && cd dotfiles && ./sync.sh

# Install sprintly (optional)
echo "Install sprintly-github by nextbigsoundinc? (y/n)"
read REPLY
[ "$REPLY" == "y" ] && source install_sprintly.sh

