#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.0  RELEASE DATE JUN 12 2015     #
# DESC: ENABLES ISYMPHONY IF INSTALLED     #
#############################################

echo ""
if rpm -qa | egrep -q iSymphonyServerV3;
then
	service iSymphonyServerV3 start &> /dev/null
	chkconfig iSymphonyServerV3 on
	echo -e "iSymphonyServerV3 has been enabled.\n"
elif rpm -qa | egrep -q iSymphonyServer;
then
	service iSymphonyServer start &> /dev/null
	chkconfig iSymphonyServer on
	echo -e "iSymphonyServer has been enabled.\n"
else
	echo -e "iSymphony does not appear to be installed."
fi