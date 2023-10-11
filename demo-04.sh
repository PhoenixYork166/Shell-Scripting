#!/bin/bash

# Creates a user account on local system
# Runner will be prompted for account name & password

# Ask for user's name
# read -p => prompt for stdin => store in var "userName"
read -p "Enter new user's username: " userName;
#printf "${userName}";

# Ask for real name 
read -p "Enter new user's real name: " realName;

# Ask for password
read -p "Enter new user's password: " password;

# Create user
# Using useradd command
# useradd [options] LOGIN
# useradd -D
# useradd -D [options]


# Set password for the user

# Force user to change password on 1st logon