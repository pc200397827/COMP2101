#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
username="$USER" #Dynamic user name
hostname="$(hostname)" #DYNAMIC hostname
day=$(date +%A) #Dayname dynamic
currenttime=$(date +%I:%M\ %p) #current date in formatting dynamic

###############
# Main        #
###############
if [ "$day" = Monday ]; #conditional execution to compare strings
then
csay="Welcome to planet $hostname, lord $username!" #adding string into variable soo can call in future
elif [ "$day" = Tuesday ];
then
csay="Welcome to planet $hostname, ethical person $username!" #adding string into variable soo can call in future
elif [ "$day" = Wednesday ];
then
csay="Welcome to planet $hostname, scripter $username!"#adding string into variable soo can call in future
elif [ "$day" = Thursday ];
then
csay="Welcome to planet $hostname, falsy $username!" #adding string into variable soo can call in future
elif [ "$day" = Friday ];
then
csay="Welcome to planet $hostname, graylog expert $username!" #adding string into variable soo can call in future
elif [ "$day" = Saturday ];
then
csay="Welcome to planet $hostname, sunny $username!" #adding string into variable soo can call in future
else
csay="Welcome to planet $hostname, assistant $username!" #adding string into variable soo can call in future
fi
cowsay "$csay It is $currenttime on $day ."
#output as required with cowsayy