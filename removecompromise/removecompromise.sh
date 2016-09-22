#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 0.1       UPDATED SEP 22 2016     #
# DESC: CLEANS UP thankuohoh COMPROMISE     #
#############################################

echo ""

if [ ! -f /etc/schmooze/pbx-version ]; then
	echo -e "This does not appear to be a FreePBX server. No changes will be made.\n"
	exit 0
fi

# Create backup of current extensions_custom.conf
NOW=$(date +"%m_%d_%Y-%H_%M_%S")
/bin/cp /etc/asterisk/extensions_custom.conf /etc/asterisk/extensions_custom.conf.bckup.$NOW

sed -i -e '/thankuohoh/d' /etc/asterisk/extensions_custom.conf

rm -rf /var/www/html/admin/libraries/php-upgrade/ext/config.php

rm -rf /var/www/html/admin/modules/weather*

amportal chown
amportal a ma refreshsignatures
amportal a r

amportal a ma enable fw_ari
amportal a ma upgradeall
amportal a r
amportal a ma upgradeall
amportal a r

amportal chown

echo ""
echo -e "Cleanup is done - manually verify that no other compromises exist. Also check /etc/passwd and /etc/shadow for rogue accounts."
echo ""
