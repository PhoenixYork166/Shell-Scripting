#!/bin/bash

# Display UID & username of user exec this script
# Display if user is root

# Display UID
printf "Your UID is: ${UID}";
printf "\n\n";
# EUID = UID
# Expands to the effective user ID of current user, initialized at shell startup.
# This variable is readonly

# However, when a file has a special UID set for itself
# The file is executed as the owner of the file
# No matther whoever the current user is
# Thus, in this case, UID != EUID
# For security reasons, do NOT set UID for files...

# ?SHELL to show all preset Shell vars

# =====================================
# Display username
#userName=$(id -un);
userName=`id -un`;
printf "Your username is: ${userName}";
printf "\n\n";

# Sanity check
# Display if user = root
if [[ "${UID}" -eq 0 ]];
then
    printf "You're root";
else
    printf "You aren't root";
fi;


# Check type of something
# type -a if;

# if is a shellKeyword
# Get man page for a shellKeyword
# help if;
# if COMMANDS; 
# then COMMANDS; 
# [ elif COMMANDS; then COMMANDS; ]... [ else COMMANDS; ] fi;

# help [[
# && operator
#if [[ condition1 && condition2 ]];

# OR operator
#if [[ condition1 || condition2 ]];

# Arithmetic binary operators
# -eq
# -ne
# -lt
# -le
# -gt
# -ge