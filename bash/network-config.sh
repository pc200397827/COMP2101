#!/bin/bash
#
# this script displays some host identification information for a simple Linux machine
#
# Sample output:
#   Hostname        : hostname
#   LAN Address     : 192.168.2.2
#   LAN Hostname    : host-name-from-hosts-file
#   External IP     : 1.2.3.4
#   External Name   : some.name.from.our.isp

# Task 1: Clean up this script by moving the commands that generate the output to separate lines
#         that put each command's output into variables. Once you have that done, Use those variables
#         in the output section at the end of the script. If the commands included in this script
#         don't make sense to you, feel free to create your own commands to find your ip addresses,
#         host names, etc.

# Task 2: Add variables for the default router's name and IP address.
#         Add a name for the router's IP address to your /etc/hosts file.
#         The router's name and address must be obtained by dynamically
#         finding the router IP address from the route table, and looking
#         up the router's hostname using its IP address, not by just
#         printing out literal text.
# sample of desired output:
#   Router Address  : 192.168.2.1
#   Router Hostname : router-name-from-hosts-file

# we use the hostname command to get our system name
# the LAN name is looked up using the LAN address in case it is different from the system name
# finding external information relies on curl being installed and relies on live internet connection
# awk is used to extract only the data we want displayed from the commands which produce extra data
# this command is ugly done this way, so generating the output data into variables is recommended to make the script more readable.
# e.g. 
#   interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')

myhostname=$(hostname) #Dynamic hostname works in all linux pc
interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}') # cutting interface name based on column and row
lan_address=$(ip a s $interface_name|awk '/inet /{gsub(/\/.*/,"");print $2}') #cutting lan address from IP
lan_hostname=$(getent hosts $(ip a s $interface_name)|awk '/inet /{gsub(/\/.*/,"");print $2}' | awk '{print $2}') #looking for hostname from manual entry from hosts
external_ip=$(curl -s icanhazip.com) #get command to get data from site
external_name=$(getent hosts $external_ip| awk '{print $2}') #hosts file lookup
router_address=$(ip r s default| cut -d ' ' -f 3) # address by cuting output
router_hostname=$(getent hosts $router_address|awk '{print $2}') #hosts file lookup

cat <<EOF
Hostname        : $myhostname
LAN Address     : $lan_address
LAN Hostname    : $lan_hostname
External IP     : $external_ip
External Name   : $external_name
Router Address  : $router_address
Router Hostname : $router_hostname
EOF

