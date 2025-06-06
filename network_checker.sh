#!/bin/bash

# --------------------------------------------
# Script: network_checker.sh
# Author : Jatin Agrawal
# Date : 06-06-2025
# Description: Checks internet connection and prints
# local IP addresses.
# --------------------------------------------

echo "Checking internet connectivity..."

# Try pinging Google (3 packets), silence the output
ping -c 3 google.com > /dev/null 2>&1

# $? stores the exit code of the last command
if [ $? -eq 0 ]; then
    echo "Internet connection is active."
else
    echo "No internet connection."
fi

# Show non-localhost IP addresses (IPv4)
echo -e "\n>> Your IP Addresses:"
ip a | grep inet | grep -v "127.0.0.1" | awk '{print $2}'