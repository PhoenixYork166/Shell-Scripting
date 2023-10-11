#!/bin/bash

# Display UID & username of the user executing this script
# Display if user is IGS or not

#printf "Your UID is ${UID}";

UID_TO_TEST_FOR='1000';
# Only display if UID != 1000
# if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]];
# then
#     printf "\nYour UID is NOT 1000";
#     # Define exit code
#     exit 1;
# elif [[ "${UID}" -eq 0 ]];
# then
#     printf "\nYour UID is 0";
#     exit 0;
# fi;

rootID='0';
rootName='root';
userName=$(id -un);

UID_userName="Your UID is ${UID}\nYour username is: ${userName}";

if [[ "${UID}" -eq "${rootID}" ]];
then
    printf "${UID_userName}\nYou're root";
    exit 0;
elif [[ "${UID}" -ne "${ROOT}" ]];
then
    printf "${UID_userName}\nYou aren't root";
    exit 1;
fi;

# Display username

# Test if command succeeded

# You can use a string test conditional

# Test for != for string