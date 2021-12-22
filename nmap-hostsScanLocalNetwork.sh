#!/bin/bash

############################################
# SYNOPSIS
# - The "nmap-hostsScanLocalNetwork" function retrieves the IP Address(es) from the local machine and does an nmap host scan for those networks.
#
###########
# NOTES
# - Name:  nmap-hostsScanLocalNetwork.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - https://nmap.org/book/man-host-discovery.html
#
###########
# EXAMPLE
<< '#comment'
my_bash_funcs$ nmap-hostsScanLocalNetwork 
Starting Nmap 7.91 ( https://nmap.org ) at 2021-10-08 17:36 PDT
Nmap scan report for _gateway (10.80.7.1)
Host is up (0.00081s latency).
MAC Address: 86:ED:C3:2A:D4:A9 (Arubisco Networks)
Nmap scan report for 10.80.7.2
Host is up (0.00079s latency).
MAC Address: 86:ED:C3:2A:D4:A9 (Arubisco Networks)
Nmap scan report for LocLaptop-PC1.boggle.local (10.80.7.56)
Host is up (0.0012s latency).
MAC Address: 75:ED:BA:F3:6C:CB (Apple)
Nmap scan report for troute66-pc.boggle.local (10.80.7.204)
Host is up.
Nmap done: 256 IP addresses (4 hosts up) scanned in 1.95 seconds
#comment


function nmap-hostsScanLocalNetwork () {
  # First we get the IPs on our systems + CIDR notation
  local IPs=$(ip address | grep "inet " | tr -s ' ' | cut -d ' ' -f3)
  # We loop over those, and if any are NOT 127.0.0.1*, then we do an NMAP hosts scan for that network
  for item in `echo "$IPs"`; do
    if [[ "$item" != 127.0.0.1* ]]; then
      sudo nmap -sn $item
    fi
  done
}

