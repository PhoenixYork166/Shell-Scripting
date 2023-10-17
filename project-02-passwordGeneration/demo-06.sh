#!/bin/bash

# Generates a random password for each user specified on the command line

# Positional arguments
# Display what the user typed on command line
printf "You executed this command: ${0}\n\n";

# Display the path & filename of this script
printf "You used $(dirname ${0}) as the path to $(basename ${0}) script\n\n";

# Tell them how many arguments they passed in
# (Inside the script they're parameters, outside they are arguments)
numberOfParameters="${#}";

printf "You supplied ${numberOfParameters} argument(s) on the command line\n\n";

# Make sure they at least supply 1 argument
if [[ ${numberOfParameters} -lt 1 ]];
then
    printf "Usage: ${0}\nUSER_NAME [USER_NAME]...\n";
    exit 1;
fi;

# Generate & display a password for each parameter
for userName in "${@}"
do
    password=$(date +%s%N | sha256sum | head -c 48);
    echo "${userName}: ${password}";
done
