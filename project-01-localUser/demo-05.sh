#!/bin/bash

# This generates a list of random passwords
# man bash
# /RANDOM
# echo ${RANDOM}

# A random number as a password
#PASSWORD=${RANDOM};
#echo ${PASSWORD};

# 3 random numbers together
#PASSWORD=${RANDOM}${RANDOM}${RANDOM}
#echo ${PASSWORD};

# Use the current date(UNIX Time) as basis for a password
#PASSWORD=$(date +%s);
#echo ${PASSWORD};

# ==========
# Date && Time
# man date
# /FORMAT
# %% => a literal %
# date -d, --date => Date now
# date -u, --utc => print OR set Coordinated Universal Time (UTC)
# date +%a => e.g. Sun
# date +%D => date +%m\/%d\/%y
# date +%R => date +%H\:%M
# date +%X\ %x => e.g. 23:13:48 12/31/99
# date +%H\:%M\:%S\ %d\/%m\/%Y => HH:MM:SS dd/mm/yyyy
# date +%s => Unix Time
# ===========

# Use nano-seconds to act as randomization
#PASSWORD=$(date +%s%N);
#echo ${PASSWORD};

# =============
# Use Checksums
# ls -la /usr/bin/*sum

# Use SHA-256 Sum for $(date +%s)
# date +% | sha256sum;
# ===============

# ============= head, fold, shuf

# === head => Printing specific numbers of lines of a file
# Casting -n Lines of a file
# head -n 1 /etc/passwd
# head -1 /etc/passwd
# Piping with Head
# printf "test\ntest2\ntest3" | head -n 2
# test
# test2

# A Better password
# date +%s => UNIX Time
# date +%N => nano-seconds
# SHA-256 checksum
# head -c 32 => Extract only 32 characters from stdin
PASSWORD=$(date +%s%N | sha256sum | head -c 32);
#echo ${PASSWORD};

# ==== fold => printing fold -b (N) characters of a line
# To each line 
# Casting -n characters of each line
# printf "1234\n5678\n4321\n8765" | fold -b1
# 1
# 2
# 3
# 4
# ...
# 8
# 7
# 6
# 5

# ==== shuf => Shuffle contents of stdin
# S='!@#$%^&*()-_+=';
# echo "${S}" | fold -w1 | shuf
# Extracting each character using 'fold'
# Shuffle the order of characters

# Display only first 3 lines of stdout
# echo "${S}" | fold -w 1 | shuf | head -c 3

# ======
# Append a special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w 1 | shuf | head -c 1);
echo "${PASSWORD}${SPECIAL_CHARACTER}";

