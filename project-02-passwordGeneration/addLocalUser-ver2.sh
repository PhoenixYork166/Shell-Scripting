#!/bin/bash
#
# This script creates a new user on local system
# Script runner must supply a username as an argument to this script
# Optionally, script runner can also provide a comment for the account as an argument
# A password will be automatically generated for the account
# userName, password & host for the account will be displayed

# Script runner must be ROOT to continue running
rootID='0';
rootName='root';
# Show current username
userName=$(id -un);

UID_userName="Your UID is ${UID}\nYour username is: ${userName}";

# If user provides < 1 arguments => Error
if [[ "${#}" -lt 1 ]];
    then
        printf "\n\nYou must enter at least 1 input\nUsage:\nsudo bash ./addLocalUser-ver2.sh USERNAME [COMMENT]\nCreate an account on the local system with the name of userName & a comment filed of COMMENT\n\n";
        # If Error => Exit code = 1
        exit 1;

else
    ## If user provides 2 or more arguments => Only use $1 as userName
    ## >= $2 arguments are treated as COMMENT
    if [[ "${UID}" -eq "${rootID}" ]];
    then
        printf "${UID_userName}\nYou're root\nContinue running\n";

        # Creates a user account on local system
        # Runner will be prompted for account name & password

        # The 1st parameter is the userName
        # Ask for user's name
        # read -p => prompt for stdin => store in var "userName"
        #read -p "Enter new user's username: " userName;
        #printf "${userName}";
        userName=${1};

        # The rest of parameters are for the account comments
        # shift to remove ${1} userName
        shift
        # After removing 1st arguments from "${@}"
        # All remaining arguments are treated as COMMENT var
        COMMENT="${@}"

        # Optionally, generating a random password for users
        #PASSWORD=$(date +%s%N | sha256sum | head -c48)
        # Ask for password
        read -p "Enter new user's password: " password;

        # Create user
        # Using useradd command
        # useradd -c "${COMMENT}" -m ${userName}
        # "${VAR}" => Allow a series of spaced comments to be stored into 1 var
        useradd -c "${COMMENT}" -m ${userName};

        # Check whether useradd command has run successfully
        if [[ ${?} -eq 0 ]];
        then
            printf "\nuser account: ${userName}\nreal name: ${COMMENT}\nhas been successfully added...\nProceeding to create password for: ${userName}...";
        elif [[ ${?} -ne 0 ]];
        then
            printf "\nCreation of user account: ${userName} has failed...Skipping...\n"
            exit 1;
        fi;

        # Set password for the user
        # CANNOT set password using passwd in Kali....
        #echo ${PASSWORD} | passwd --stdin ${userName}
        echo "${userName}:${password}" | sudo chpasswd;
        if [[ ${?} -eq 0 ]];
        then
            printf "\n${userName}'s password has been created successfully...Proceeding to expire ${userName}'s account on first logon...\n"
        else
            printf "\n${userName}'s password could NOT be created...\nMake sure you're root...\n"
            exit 1;
        fi;

        # Force user to change password on 1st logon by
        # expiring existing password
        passwd -e ${userName};
        if [[ ${?} -eq 0 ]];
        then
            printf "\n${userName}'s password has been expired by design...${userName} must change password upon first logon\n"
        else
            printf "\n${userName}'s password has NOT been expired by design...\nMake sure you're root running this script\n"
        fi;
            
        echo;
        echo 'username: ';
        echo "${userName}";
        echo
        echo 'password: ';
        echo "${password}";
        echo;
        echo 'host: ';
        echo "${HOSTNAME}";
        printf "\n\nThis script was run successfully\n\n";
        # Define exit code == 0 if succeeded
        exit 0;
    

    elif [[ "${UID}" -ne "${rootID}" ]];
    then
        printf "${UID_userName}\nYou aren't root\nSkipping execution...\n"; 
        exit 1;
    fi;
    ##
fi;



    
