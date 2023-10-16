#!/bin/bash

# Creates a user account on local system
# Runner will be prompted for account name & password

# Ask for user's name
# read -p => prompt for stdin => store in var "userName"
read -p "Enter new user's username: " userName;
#printf "${userName}";

# Ask for real name or Ticket number in COMMENT
read -p "Enter new user's real name: " COMMENT;

# Ask for password
read -p "Enter new user's password: " password;

# Create user
# Using adduser command
# adduser [--uid id] [--firstuid id] [--comment comment] 
# adduser [--allow-all-names] [--allow-bad-names] 
# "${VAR}" => Allow spaced comments to be stored into a var
useradd -c "${COMMENT}" -m ${userName};

# Set password for the user
# CANNOT set password using passwd....
echo "${userName}:${password}" | sudo chpasswd;

# Force user to change password on 1st logon
passwd -e ${userName};