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
    echo "if (when) the dmg mount window opens, ignore it and come back to Terminal"
    sleep 3
    # Install Command Line Tools
    source install_gcc.sh
else
    echo "gcc installed"
fi

# Install Homebrew
ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

# set Homebrew bin dirs to come before the system's
sudo sh -c 'echo "/usr/local/bin\n/usr/local/sbin\n$(cat /etc/paths)" > /etc/paths'

# make sure all is good in the land of Homebrew
brew doctor

# Install Git, bash completion, and hub (a GitHub tool)
brew install git bash-completion hub mongodb

# replace LLVM gcc for rvm
brew tap homebrew/dupes
brew install autoconf automake apple-gcc42 libyaml

# TODO: detect if could not link apple-gcc42 and run...
# sudo chown root:admin /usr/local/include/
# sudo chmod g+w /usr/local/include
# brew link apple-gcc42

# Install RVM
curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
# set to auto-install dependencies, will use Homebrew
rvm autolibs 3
rvm pkg install openssl
# OS X workaround
rvm reinstall all --force

# Install RubyGems
source install_rubygems.sh

# Install Node Version Manager
source install_nvm.sh

# Set global configs for git
source git_config.sh

# Install Pygments for syntax highlighting
sudo easy_install Pygments

# Install PEAR
source install_pear.sh

# Install isocket's custom version of thrift
source install_isocket-thrift.sh

# Add maven jvm options to .bash_profile to prevent running out of heapspace
echo export MAVEN_OPTS=\"-Xmx512m -XX:MaxPermSize=128m\" >> ~/.bash_profile

# Install dotfiles (optional)
echo "Install dotfiles by maxbeatty? (y/n)"
read REPLY
[ "$REPLY" == "y" ] && hub clone maxbeatty/dotfiles && cd dotfiles && ./sync.sh

# Install sprintly (optional)
echo "Install sprintly-github by nextbigsoundinc? (y/n)"
read REPLY
[ "$REPLY" == "y" ] && source install_sprintly.sh
