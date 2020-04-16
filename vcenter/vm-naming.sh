#!/bin/bash
 
. /utils.sh
 
# Install uuidgen
#apk add --no-cache util-linux
 
# Creating custom vm name/hostname
custom_tag="dclab-"
vmName="$custom_tag$(uuidgen | fold -w 8 | head -1 | tr '[:upper:]' '[:lower:]')"
#vmName="$custom_tag$(($RANDOM + ($RANDOM % 2) * 32768))"
content="{ 'vmName':  '$vmName'}";
 
# Print the results
print_ext_service_result "$content"
 
# Recording IPAM execution and env variables
curl -s -o /tmp/record_results.sh http://http.cliqrtech.com/auto/record_results.sh
chmod 755 /tmp/record_results.sh
source /tmp/record_results.sh callout-vmNaming $vmName > /dev/null 2>&1
rm -fr /tmp/record_results.sh
