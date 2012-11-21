#!/bin/bash
# Install PEAR

# Download
curl -O http://pear.php.net/go-pear.phar

# create php.ini from system default
sudo cp /etc/php.ini.default /etc/php.ini

echo "Use all defaults (read: keep pressing enter)"

# Install 
php -d detect_unicode=0 go-pear.phar

# cleanup
rm go-pear.phar

# Add to PATH w/ dotfiles/.extra
