#!/bin/bash
# This script installs everything you need to get started setting up a new machine

# Get basic info from user like name and email
source user_prompt.sh

# generate ssh key
source generate_ssh.sh

# if gcc is not installed, go download and install it
gcc -v
if [ "$?" -ne "0" ]; then
    echo "gcc not installed (CLT)"
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
[ "$REPLY" == "y" ] && cd ~/Sites && hub clone maxbeatty/dotfiles && cd dotfiles && ./sync.sh

# Install sprintly (optional)
echo "Install sprintly-github by nextbigsoundinc? (y/n)"
read REPLY
[ "$REPLY" == "y" ] && source install_sprintly.sh

