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
    printf "${UID_userName}\nYou're root\n";
    #exit 0;
elif [[ "${UID}" -ne "${ROOT}" ]];
then
    printf "${UID_userName}\nYou aren't root\n";
    #exit 1;
fi;

# Display username
#printf "\nYour username is: ${userName}";

# Test if command succeeded
# ${?} => Most recent executed command exit code
if [[ "${?}" -ne 0 ]];
then
    printf "\nThe $(id -un) command did NOT execute successfully\n";
    #exit 1;
fi;

printf "\nYour usename is: ${userName}";

# You can use a string test conditional
userNameToTestFor='phoenix';
# = exact match
# == pattern match
if [[ "${userName}" = "${userNameToTestFor}" ]];
then
    printf "\nYour username matches ${userNameToTestFor}\n";
elif [[ "${userName}" != "${userNameToTestFor}" ]];
then
    printf "\nYour username does NOT match ${userNameToTestFor}\n";
fi;

# Test for != for string