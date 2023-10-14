#!/bin/bash

# Create a user with a two-week expiry date
username="user1"
password="password123"
expiry_date=$(date -d "+2 weeks" +%Y-%m-%d)
useradd -e $expiry_date $username
echo -e "$password\n$password" | passwd $username

# Prompt the user to change their password on login
chage -d 0 $username

# Attach the user to a group to run 'cat' command on /etc/
groupname="catgroup"
groupadd $groupname
usermod -aG $groupname $username

# Create another user without a home directory
useradd -M user2

echo "User $username created with a two-week expiry date and password change on login."
echo "User $user2 created without a home directory."

