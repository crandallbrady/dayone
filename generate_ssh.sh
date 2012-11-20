#!/bin/bash

# get user info incase being run as standalone script
source user_prompt.sh

echo "USE A PASSPHRASE!!!"

ssh-keygen -t rsa -C "$user_email" 
