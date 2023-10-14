#!/bin/bash
#echo "Hello World!"

# name="John Doe" #convention for naming variables in bash
# greeting="Hello"

# echo my name is ${name} # my name is John Doe
# echo my name is $name # my name is John Doe
# echo $greeting, my name is $name # Hello, my name is John Doe

# echo "hello there" $1
# echo "Hello there" $2
# echo "this is for all the variables" $@ #this is for all the variables

#User Inputs in Bash 
# echo "What is your name?"
# read name

# echo "Hi there $name"
# echo "welcome to Altschool"  

#shortform
#get the name of the user
# read -p "What is your name?" name
# # greet the user
# echo "Hi there $name"
# echo "welcome to Altschool"

#Bash Comments 
#This is a sample for writting comments in bash

#Bash Arguments
#To pass an argument you just need to add it to the end of the command
# ./test.sh John Doe (do not forget to add the $1 and $2 in the script)

# echo "Argument 1: $1"
# echo "Argument 2: $2"
# echo "Argument 3: $3"
# echo "All Arguments : $@"
#{sh test.sh} {./test.sh} Argument1 Argument2 Argument3

#Bash Arrays
#To create an array in bash you need to use the following syntax
#my_array=("value1" " 
#first value is 0, second is 1, third is 2, etc
# my_array=(apple banana orange) #"Fruit Basket"
# #to call an array you need to use the following syntax
# #name_of_array[index]
# echo ${my_array[0]} #apple
# echo ${my_array[@]} #all array values
# echo ${#my_array[@]} #number of elements in the array

#Bash Slicing
# letters=("A" "B" "C" "D" "E" "F" "G")
# # echo ${letters[@]}
# b=${letters[@]:4:5} 
# echo "${b}"

#Bash Conditionals Expressions
#conditonal expressions, conditional statements, conditional constructs
#they are features of a programming language, 
#which performs different computations or actions depending on whether
#a programmer specified boolean condition evaluates to true or false

#List of most popular conditional expressions
#File Expression

#. true if file exists
#[[ -a ${file} ]]
#[[ -e ${file} ]]
#. true if the file is a block special file
#[[ -b ${file} ]]
#. true if the file is a character special file
#[[ -c ${file} ]]
#. true if the file is a directory
#[[ -d ${file} ]]
#. true if the file exists and is a regular file
#[[ -f ${file} ]]
#. true if the file exists and is a symbolic link
#[[ -h ${file} ]]
#[[ -L ${file} ]]
# true if the file is writable
#[[ -w ${file} ]]

#String Expressions
#true if the shell variable var is set
#[[ -v ${var} ]]
#true if the length of string is zero
#[[ -z ${string} ]]
#true if the length of string is non-zero
#[[ -n ${string} ]]
#true if the strings are equal
#[[ ${string1} == ${string2} ]]
#true if the strings are not equal
#[[ ${string1} != ${string2} ]]
#true if string1 sorts before string2 lexicographically
#[[ ${string1} < ${string2} ]]
#true if string1 sorts after string2 lexicographically
#[[ ${string1} > ${string2} ]]

#Arithmetic Expressions
#true if the integers are equal
#[[ ${int1} -eq ${int2} ]]
#true if the integers are not equal
#[[ ${int1} -ne ${int2} ]]
#true if int1 is less than int2
#[[ ${int1} -lt ${int2} ]]
#true if int1 is less than or equal to int2
#[[ ${int1} -le ${int2} ]]
#true if int1 is greater than int2
#[[ ${int1} -gt ${int2} ]]
#true if int1 is greater than or equal to int2
#[[ ${int1} -ge ${int2} ]] 

#AND & OR operators

#[[ test_case1 ]] && [[ test_case2 ]]
#[[ test_case1 ]] || [[ test_case2 ]]

# Exit status 
# return true id the command was successful without any errors
#[[ $? -eq 0 ]]
# return true if the command was not successful or had errors
#[[ $? -gt 0 ]]

# int1=5
# int2=10
# echo "Are the integers equal?"
# if [[ ${int1} -eq ${int2} ]]
# then
#     echo "true"
# else
#     echo "false"
# fi

#Bash Conditionals 
#if, if-else, switch, case

#if 
#if [[ some_test]]
#then
#    #statements/commands
#fi

# read -p "What is your name?" name
# if [[ -z ${name} ]]
# then
#     echo "You did not enter a name"
#     exit 1
# fi

#if-else 
# admin="John Doe"
# read -p "What is your name?" name
# if [[ "${name}" == "${admin}" ]]
# then
#     echo "You are an Admin User"
# else
#     echo "You are not an Admin User"
# fi

# if (( $EUID == 0)); then
#     echo "You are root"
#     exit 
# else
#     echo "You are not root"
#     exit 1
# fi

# admin="John Doe"
# read -p "What is your name?" username

# #check if the user is root
# if [[ "${username}" != "${admin}" ]] || [[ $EUID != 0 ]];
# then
#     echo "You are not an admin user or a root user"
#     exit 1
# else 
#     echo "You are an admin user and a root user"
#     exit 0
# fi

# read -p "Enter a number: " num

# if [[ $num -gt 0 ]]; then 
#     echo "The number is positive" #above 0
# elif [[ $num -lt 0 ]]; then
#     echo "The number is negative" #below 0
# else
#     echo "The number is zero" #0
# fi

#Switch Case Statements
# case ${variable} in
#     pattern1)
#         #statements
#         ;;
#     pattern2| pattern3)
#         #statements
#         ;;
#     *)
#         #default statements
#         ;;
# esac
# Rundown of the case structure
# 1. The case statement starts with the case keyword followed by the variable name
# 2. The variable name is followed by the in keyword
# 3. The patterns are listed after the in keyword this patterns can be separated by a pipe: |
# 4. All clauses have to be terminated by a double semicolon: ;;
# 5. You can have a defailt statement by adding an asterisk: *
# 6. The case statement ends with the esac keyword

# read -p "What is the name of your car brand: " car

# case $car in 
#     "Testla")
#         echo -n "You are a big man using ${car} in Nigeria"
#         ;;
#     "Toyota" | "honda" | "Nissan")
#         echo -n "You follow for middle class people using ${car} in Nigeria"
#         ;;
#     "Mercedes" | "BMW" | "Audi")
#         echo -n "You done arrive using ${car} in Nigeria"
#         ;;
#     *)
#         echo -n "You no follow for popular cars  using ${car} in Nigeria"
#         ;;
# esac

#Bash Loops
#for loop
#for in do
# for f in $( ls /Users/user/Documents/Altschool/Training/ ); do 
#     echo $f
# done # all the files in /Users/user/Documents/Altschool/Training folder

#check if an argument is provided
# if [ -z "$1" ]; then
#     echo "No argument provided"
#     exit 1
# fi
#  #Check the disk usage of the provided directory
# used=$( df $1 | tail -1 | awk '{print $5}' | sed 's/%//')
# #df checks disk space in Linux 
# #tail prints the last N number of data of the given output
# #awk is used to parse an output


# if [ $used -gt 90 ]; then 
#    echo "Low disk space"
#    exit 1
# fi 

# echo "Disk space is OK."

# for (( counter=10; counter>0; counter-- ))
# do 
# echo -n "$counter"
# done 
# printf "\n"
 
#while loop

# count=6
# while [ $count -gt 0 ]; do 
#      echo Value of count is: $count
#      let count=count-1
# done
#until loop

# count=0
# until [ $count -gt 5 ]; do
#     echo Value of count is: $count
#     let count=count+1
# done

#function to get current free memory percent of
# get_free_memory_percent(){
#     free | grep Mem | awk '{print($4/$2) * 100.0}'
# }

# # function to clean up cache
# clean_cache(){
#     echo "memory is low. Cleaning up cache..."
#     sync
#     echo 3 > /proc/sys/vm/drop_caches
# }
# # Monitor memory until it is below 20%
# until [ $(echo "$(get_free_memory_percent) < 20" | bc) -eq -1 ]; do
#     free_mem=$(get_free_memory_percent)
#     echo "Free memory is $free_mem%"
#     sleep 3 
# done
# echo "Cleaning up cache..."
# clean_cache
# echo "Done"

# #After cleanup, monitor memory again until it is below 20%
# until [ $(echo "$(get_free_memory_percent) < 20" | bc) -eq 1 ]; do
#     free_mem=$(get_free_memory_percent)
#     echo "Warning: After cleanup, free memory is still below 20%"

#     sleep 3

# done

# echo "Warning: After cleanup, free memory is now below 20%"

#functions

#declare a function
# function name(){
#     echo "This is a function"
#     echo $1
# }

# name
function greeting(){
    first_name=$1
    last_name=$2

    if [ -z "$first_name" ] || [ -z "$last_name" ]; then
        echo "Both first and last names are required"
        return 1
    fi

    echo "Hello $first_name $last_name"
}

greeting "John" "Doe"
greeting "Alice" "Rabbit"
greeting "Christiana"

function greet(){
    # check f the required arguments are provided 
    if [ -z "$1" ] || [ -z "$2" ]; then
       echo "Both values are required"
       return 1
    fi

    local name=$1
    local message=$2

    echo " $name, $message"
}

# Using the greet function
greet "John" "Hello World"
greet "Michael" "You are a nice guy"

#Assignment 1
# Create a Bash script that accepts directory paths as arguments. For each argument, list the contents of each directory with the name of each listed at the top.

# If you want to give yourself an added challenge, 
# have your script accept an additional argument, 
# “a” or “d,” that sorts the contents of each directory 
# in either ascending or descending order. 
# For even more of a challenge, 
# create a Bash script that sorts the 
# contents of the directories based on an “a” or “d” argument that directly precedes it. 
# In other words, you should be able to sort one directory in ascending order, 
# a second directory in descending order, and so on.

# Assignment 2
# Another way to work with text in Bash is with AWK commands. 
# For this challenge we’ll use the following data set of the world’s countries and their capitals.

# Create a Bash script that outputs this dataset into two columns: 
# one for the country and the other for its capital.

# For an added challenge, 
# have your script accept a letter as input. 
# The output should be just the countries that start with the input letter. 
# For another challenge, create another Bash script that outputs a 
# two-column list sorted alphabetically by capital city.

# Script 1: Display Countries and Capitals in Two Columns

# # Dataset of countries and their capitals
# DATA="United States,Washington
# United Kingdom,London
# China,Beijing
# Russia,Moscow
# India,New Delhi
# Brazil,Brasilia
# Australia,Canberra"

# # Print header
# echo -e "Country\t\t\tCapital"

# # Print countries and capitals in two columns
# echo "$DATA" | awk -F, '{printf "%-20s\t%-20s\n", $1, $2}'

# Script 2: Filter Countries by Starting Letter

# #!/bin/bash

# # Check if the number of arguments provided is correct
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <starting_letter>"
#     exit 1
# fi

# # Dataset of countries and their capitals
# DATA="United States,Washington
# United Kingdom,London
# China,Beijing
# Russia,Moscow
# India,New Delhi
# Brazil,Brasilia
# Australia,Canberra"

# # Print header
# echo -e "Country\t\t\tCapital"

# # Filter and print countries and capitals starting with the given letter
# echo "$DATA" | awk -v letter="$1" -F, '$1 ~ "^"letter {printf "%-20s\t%-20s\n", $1, $2}'


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
# Option 1 Assignment 3
# # Check if a script argument is provided
# if [ -z "$1" ]; then
#   echo "Usage: $0 [mount_point_or_file_system]"
#   exit 1
# fi

# # Store the mount point or file system name
# MOUNT_POINT="$1"

# # Use the `df` command to get disk usage information
# # and `grep` to filter out the specific mount point or file system
# MOUNT_INFO=$(df --output=source,pcent,avail | grep "$MOUNT_POINT")

# # Check if the mount point or file system is mounted
# if [ -z "$MOUNT_INFO" ]; then
#   echo "Error: The mount point or file system '$MOUNT_POINT' is not mounted."
#   exit 2
# else
#   # Extract and display used space and free space
#   USED_SPACE=$(echo "$MOUNT_INFO" | awk '{print $2}')
#   FREE_SPACE=$(echo "$MOUNT_INFO" | awk '{print $3}')
  
#   echo "The mount point or file system '$MOUNT_POINT' is mounted."
#   echo "Used Space: $USED_SPACE"
#   echo "Free Space: ${FREE_SPACE}K" # The free space is shown in kilobytes by default
# fi

# option2 Assignment 3
# Check if the number of arguments provided is correct
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <mount_point_or_file_system>"
#     exit 1
# fi

# # Assign the provided argument to a variable for clarity
# MOUNT_POINT_OR_FILE_SYSTEM="$1"

# # Use the `mountpoint` command to check if the given path is a mount point
# mountpoint -q "$MOUNT_POINT_OR_FILE_SYSTEM"
# if [ $? -eq 0 ]; then
#     # Use `df` command to fetch disk usage statistics for the given mount point or file system
#     OUTPUT=$(df --output=used,avail "$MOUNT_POINT_OR_FILE_SYSTEM" | tail -n 1)
#     USED_SPACE=$(echo $OUTPUT | awk '{print $1}')
#     FREE_SPACE=$(echo $OUTPUT | awk '{print $2}')

#     echo "Mount point or file system '$MOUNT_POINT_OR_FILE_SYSTEM' is mounted."
#     echo "Used Space: $USED_SPACE KB"
#     echo "Free Space: $FREE_SPACE KB"
# else
#     echo "Error: Mount point or file system '$MOUNT_POINT_OR_FILE_SYSTEM' is not mounted."
#     exit 2
# fi