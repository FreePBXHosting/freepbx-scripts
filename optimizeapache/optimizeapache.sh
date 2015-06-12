#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.0  RELEASE DATE JUN 12 2015     #
# DESC: OPTIMZES APACHE MEM USAGE IN FPBX   #
#############################################

echo ""

# Create backup of current httpd.conf
NOW=$(date +"%m_%d_%Y-%H_%M_%S")
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bckup.$NOW

# Apply changes to httpd.conf
sed -i -e "/StartServers  /c\StartServers       5" /etc/httpd/conf/httpd.conf
sed -i -e "/MinSpareServers  /c\MinSpareServers    3" /etc/httpd/conf/httpd.conf
sed -i -e "/MaxSpareServers  /c\MaxSpareServers   5" /etc/httpd/conf/httpd.conf
sed -i -e "/MaxClients   /c\MaxClients       150" /etc/httpd/conf/httpd.conf

echo -e "Gracefully restarting Apache in 5 seconds. Please wait.\n"
sleep 5

# Gracefully restart Apache
service httpd graceful

echo ""
echo -e "Apache has been optimized, and a backup of the original config is available here: /etc/httpd/conf/httpd.conf.bckup.$NOW \n"