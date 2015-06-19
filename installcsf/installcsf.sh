#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.2       UPDATED JUN 19 2015     #
# DESC: INSTALL CSF ON FREEPBX, OPEN PORTS  #
#############################################

echo ""

if [ ! -f /etc/schmooze/pbx-version ]; then
	echo -e "This does not appear to be a FreePBX server. No changes will be made.\n"
	exit 0
fi

# Stop and disable fail2ban
service fail2ban stop
chkconfig fail2ban off

# Download and install CSF
mkdir /root/build
cd /root/build
rm -fv csf.tgz
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh

# Enable CSF and open ports in CSF config
sed -i -e '/TESTING = "1"/c\TESTING = "0"' /etc/csf/csf.conf
sed -i -e '/TCP_IN = "/c\TCP_IN = "20,21,22,53,80,5060,10000:20000"' /etc/csf/csf.conf
sed -i -e '/TCP_OUT = "/c\TCP_OUT = "1:65535"' /etc/csf/csf.conf

echo -e "Gracefully restarting Apache. Please wait.\n"
sleep 1

# Gracefully restart Apache
service httpd graceful

echo ""
echo -e "Apache has been optimized, and a backup of the original config is available here: /etc/httpd/conf/httpd.conf.bckup.$NOW \n"