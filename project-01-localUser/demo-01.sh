#!/bin/bash

# Assign a var
WORD='script';
printf ${WORD};
printf "\n\n";
# See '${WORD}' not be interpreted
printf '${WORD}';
printf "\n\n";

# Another var
ENDING='ed';

# Combine 2 vars
echo "This is ${WORD}${ENDING}";