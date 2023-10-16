#!/bin/bash

# Display UID & username of user exec this script
# Display if user is root

# Display UID
#printf "Your UID is ${UID}";
#printf "\n\n";
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
user_name=$(id -un);
echo ${user_name};
# Display if user = root

