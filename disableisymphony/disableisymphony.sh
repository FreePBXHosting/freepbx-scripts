#!/bin/bash
#############################################
# Created by Alex Leach - @ajleach          #
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.3  RELEASE DATE JUN 12 2015     #
# DESC: DISABLES ISYMPHONY IF INSTALLED     #
#############################################

echo ""
if rpm -qa | egrep -q iSymphonyServerV3;
then
	if chkconfig iSymphonyServerV3;
	then
		service iSymphonyServerV3 stop &> /dev/null
		chkconfig iSymphonyServerV3 off
		echo -e "iSymphonyServerV3 has been disabled.\n"
	else
		echo -e "iSymphonyServerV3 is already disabled.\n"
		service iSymphonyServerV3 stop &> /dev/null
		exit 0
	fi
elif rpm -qa | egrep -q iSymphonyServer;
then
	if chkconfig iSymphonyServer;
	then
		service iSymphonyServer stop &> /dev/null
		chkconfig iSymphonyServer off
		echo -e "iSymphonyServer has been disabled.\n"
	else
		echo -e "iSymphonyServer is already disabled.\n"
		service iSymphonyServer stop &> /dev/null
		exit 0
	fi
else
	echo -e "iSymphony does not appear to be installed."
fi
