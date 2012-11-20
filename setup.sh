#!/bin/bash
# This script installs everything you need to get started setting up a new machine
# TODO: prompt for name and email for gitconfig


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

# Install RubyGems
#cd /tmp
#curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz
#tar zxf rubygems-1.8.24.tgz
#cd rubygems-1.8.24
#sudo ruby setup.rb --no-format-executable

# Install Chef
#sudo gem install chef --no-ri --no-rdoc

# Install Homebrew
#ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
#brew doctor

# Install Git
#brew install git bash-completion hub

# Install Pygments for syntax highlighting
#sudo easy_install Pygments

# Install PEAR
#brew install wget
#wget http://pear.php.net/go-pear.phar -O /tmp/go-pear.phar
#php -d detect_unicode=0 /tmp/go-pear.phar


