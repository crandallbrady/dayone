#!/bin/bash
# this is basically all from the README at https://github.com/isocket/thrift

# install dependencies
brew install libtool pkg-config

# tell user where their local copy of thrift will go
echo "Now cloning the isocket/thrift repo to ~/Documents/thrift (you can move it later)"

git clone isocket/thrift ~/Documents/thrift

# cd to local repo, while saving current directory
pushd ~/Documents/thrift

./bootstrap.sh

./configure

make

sudo make install

# fix dir permissions for Homebrew (the `sudo make install` messes it up...)
sudo chown `whoami` /usr/local/lib/pkgconfig

# return back to directory we started in
popd
