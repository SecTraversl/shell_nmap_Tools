#!/bin/bash

############################################
# SYNOPSIS
# - The "nmap-hostsResultsParsed" function takse the text results from an nmap host scan and returns back only the lines with pertinent information.
#
###########
# NOTES
# - Name:  nmap-hostsResultsParsed.sh
# - Author:  Travis Logue
# - Version History:  1.1 | Initial Version
# - Dependencies:  
# - Notes:
#   - I found the code for this "find-all" function here, but made some modifications for use with python3: https://unix.stackexchange.com/questions/6/what-are-your-favorite-command-line-features-or-tricks
#
###########
# EXAMPLE
<< '#comment'
my_bash_funcs$ nmap-hostsScanLocalNetwork | nmap-hostsResultsParsed 
Nmap scan report for _gateway (10.80.7.1)
MAC Address: 86:ED:C3:2A:D4:A9 (Arubisco Networks)
Nmap scan report for 10.80.7.2
MAC Address: 86:ED:C3:2A:D4:A9 (Arubisco Networks)
Nmap scan report for LocLaptop-PC1.boggle.local (10.80.7.56)
MAC Address: 75:ED:BA:F3:6C:CB (Apple)
Nmap scan report for troute66-pc.boggle.local (10.80.7.204)
Nmap done: 256 IP addresses (4 hosts up) scanned in 1.95 seconds
#comment
############################################


function nmap-hostsResultsParsed () {
  
  function find-all () {
    python3 -c "import re
import sys
for i in re.findall('$1', sys.stdin.read()):
    if type(i) == type(''):
        print(i)
    else:
        print(i[0])
    "
  }

  # Here we search for the lines starting with one of the following strings
  find-all "(?:Nmap scan report for.*|MAC Address.*|Nmap done.*)"
}

