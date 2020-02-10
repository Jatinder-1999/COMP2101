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

HostName=$(hostname)
Interfacename=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
LanIpAddress=$(ip a s $Interfacename|awk '/inet /{gsub(/\/.*/,"");print $2}')
LanHostname=$(getent hosts $LanIpAddress | awk '{print $2}')
ExternalIp=$(curl -s icanhazip.com)
ExternalName=$(getent hosts $ExternalIp| awk '{print $2}')
RouterAddress=$(ip route | grep 'default'| awk '{print $3}')
RouterHostname=$(getent hosts $RouterAddress | awk '{print $2}')

cat <<EOF
Hostname        : $HostName
LAN Address     : $LanIpAddress
LAN Hostname    : $LanHostname
External IP     : $ExternalIp
External Name   : $ExternalName
Router Address  : $RouterAddress
Router Hostname : $RouterHostname
EOF
