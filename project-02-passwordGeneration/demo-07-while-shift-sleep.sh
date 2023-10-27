#!/bin/bash

# Demonstrate the use of shift & while loops
echo "Parameter 1: ${1}";
echo "Parameter 2: ${2}";
echo "Parameter 3: ${3}";

# type -a while
# while COMMANDS; do COMMANDS-2; done;
# while TRUE => do
# X=1;
# while [[ "${X}"" -eq 1 ]];
# do echo "This is the value of X: ${X}";
# X=7;
# done;

# type -a true
# Return a successful result
# Exit status:
# Always succeeds

# type -a sleep
# sleep is /usr/bin/sleep
# sleep is /bin/sleep
# man sleep
# Delay for a specified amount of time
# sleep NUMBER[SUFFIX] => 
# SUFFIX may be 's' for seconds (the default)
# 'm' for minutes, 'h' for hours, 'd' for days
# NUMBER need NOT be an integer
# sleep OPTION

# while [[ true ]];
# do 
#     echo "${RANDOM}";
#     sleep 1;
# done;

# type -a shift
# shift is a shell builtin
# help shift
# shift: shift [n]
# 'shift' = Positional parameters
# Rename the positional parameters $N+1,$N+2 ... to $1,$2 ...
# If N is NOT given, it is assumed = 1
# Exit status:
# Returns success unless N <= 0 OR > $#

# Loop through all positional parameters
while [[ "${#}" -gt 0 ]];
do
    echo "Number of parameters: ${#}";
    echo "Parameter 1: ${1}";
    echo "Parameter 2: ${2}";
    echo "Parameter 3: ${3}";
    echo
    shift 
done;
# shift removes ${1}
# ./demo-07.sh hello hi
# Number of parameters: 1
# Parameter 1: hi
# Parameter 2: 
# Parameter 3: 
