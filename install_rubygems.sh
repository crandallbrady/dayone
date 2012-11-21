#!/bin/bash
# Install RubyGems

# download latest version
curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz

# unpack
tar zxf rubygems-1.8.24.tgz && cd rubygems-1.8.24

# setup
sudo ruby setup.rb --no-format-executable

# cleanup
cd .. && rm rubygems-1.8.24.tgz && rm -r rubygems-1.8.24
