#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.0  RELEASE DATE JUN 12 2015     #
# DESC: DISABLES ISYMPHONY IF INSTALLED     #
#############################################

echo ""
if [rpm -qa | egrep -q iSymphonyServerV3]
then
	service iSymphonyServerV3 stop
	chkconfig iSymphonyServerV3 off
	echo -e "iSymphonyServerV3 has been disabled.\n"
elif [rpm -qa | egrep -q iSymphonyServer]
then
	service iSymphonyServer stop
	chkconfig iSymphonyServer off
	echo -e "iSymphonyServer has been disabled.\n"
else
	echo -e "iSymphony does not appear to be installed."
fi