#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION *TESTING* UPDATED JUN 18 2015     #
# DESC: OPTIMIZES APACHE MEM USAGE IN FPBX  #
#############################################
# This script will change the StartServers, #
# MinSpareServers, MaxSpareServers, and     #
# MaxClients variables in                   #
# /etc/httpd/conf/httpd.conf and gracefully #
# restart Apache.                           #
#############################################

echo ""

if [ ! -f /etc/schmooze/pbx-version ]; then
	echo -e "This does not appear to be a FreePBX server. No changes will be made.\n"
	exit 0
fi

# Create backup of current httpd.conf
NOW=$(date +"%m_%d_%Y-%H_%M_%S")
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bckup.$NOW

# Apply changes to httpd.conf
sed -i -e "/StartServers  /c\StartServers       2" /etc/httpd/conf/httpd.conf
sed -i -e "/MinSpareServers  /c\MinSpareServers    1" /etc/httpd/conf/httpd.conf
sed -i -e "/MaxSpareServers  /c\MaxSpareServers   2" /etc/httpd/conf/httpd.conf
sed -i -e "/MaxClients   /c\MaxClients       10" /etc/httpd/conf/httpd.conf

echo -e "Gracefully restarting Apache. Please wait.\n"
sleep 1

# Gracefully restart Apache
service httpd graceful

echo ""
echo -e "Apache has been optimized, and a backup of the original config is available here: /etc/httpd/conf/httpd.conf.bckup.$NOW \n"