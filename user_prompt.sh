#!/bin/bash
# prompt for user info

# name
if [ -z "$user_name" ]; then
    echo "What is your full name? (First Last)"
    read user_name
fi

# email
if [ -z "$user_email" ]; then
    echo "What is your company email address?"
    read user_email
fi
