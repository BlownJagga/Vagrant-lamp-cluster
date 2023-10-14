#Assignment 3
# Programmers who work in Bash are often System Administrators who manage computer and server networks. 
# So, it’s important to know which disks and file systems are mounted — 
# that is, accessible by the computer’s file system. 
# Note that just because a disk or 
# computer is physically attached with cables doesn’t always mean that it’s mounted and accessible.

# Come up with a Bash script that detects whether a given mount point or file system is mounted. 
# If so, the script should return the amount of used space on the file system and the amount of free space. 
# If the file system isn’t mounted, your script should return an error message.

# Looking for an extra challenge? 
# Add a prompt to your script that asks the user if they want to attempt to mount the file system if it’s unmounted. 
# When the file system mounts, the script should then output the amount of used space and free space in the file system.

#Result 
#!/bin/bash

#check if the number of arguments provided is correct
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 mountpoint (Error message: Wrong number of arguments)"
    exit 1
fi

#Assign the provided arguments to the variables 
mountpoint="$1"

# Use the mountpoint command to check if the given path is a mount point
mountpoint -q "$mountpoint"
if [ $? -eq 0 ]; then
    # Use df command to fetch the disk usage statistics for the given mountpoint
    OUTPUT=$(df --output=used,avail "$mountpoint" | tail -n 1)
    USED_SPACE=$(echo "$OUTPUT" | awk '{print $1}')
    FREE_SPACE=$(echo "$OUTPUT" | awk '{print $2}')

    echo "Mount point or file system '$mountpoint' is mounted"
    echo "Used space: $USED_SPACE KB"
    echo "Free space: $FREE_SPACE KB"
else
    echo "Mount point or file system '$mountpoint' is not mounted"
    exit 2
fi