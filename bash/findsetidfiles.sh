#!/bin/bash
#
# this script generates a report of the files on the system that have the setuid permission bit turned on
# it is for the lab1 exercise
# it uses the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files are sorted by their owner

# Task 1 for the exercise is to modify it to also find and display the setgid files in a second listing
# The second listing should display after the setuid file list, and be formatted similar to the
# setuid file list including having a title
# use the find command to find files of the right type and with the right permissions, and an error redirect to
# /dev/null so we do not get errors for inaccessible directories and files
# the identified files should be sorted by their group

# Task 2 for the exercise is to modify it to also display the 10 largest regular files in the system, sorted by their sizes
# The listing should only have the file name, owner, and size in MBytes and be displayed after the listings of
# setuid and setgid files and should have its own title
# use the find command to generate the list of files with their sizes, with an error redirect to /dev/null
# use cut or awk to display only the output desired

echo "Setuid files:"
echo "============="
find / -type f -executable -perm -4000 -ls 2>/dev/null|
sort -k 3
echo ""
echo "Setgid files:"
echo "============="
find / -type f -executable -perm -2000 -ls 2>/dev/null|
sort -k 6
# Same as set uid above, it shows file with set gid bit enabled and gurbage errors. All listing is based on group which is on column 6 represented by -k no.6
echo ""
echo "10 largest files in system are:"
echo "==============================="
find /home/ -type f -exec ls -alh 2>/dev/null --block-size=M {} + | #Find command finds files on root directory and applies ls-alh command on all lines after creating full lists. also gives human readable memory size formet which is readable by humans and garbages the errors.
sort -hr -k5 | #It shorts reversly by making memory size deferences by -h command and shorts 5th column
head -n 10 | #it represents first 10 lines on pipe outout
awk 'NR>2{ print $5, $3, $9}' #this awk example is found online which shows by this way we can dynamically represents the columns based on requirements

echo ""
