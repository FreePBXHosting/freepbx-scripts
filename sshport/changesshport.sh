#!/bin/bash
#############################################
# FreePBXHosting.com - @freepbxhosting      #
# VERSION 1.5       UPDATED JUN 25 2015     #
# DESC: CHANGES SSH PORT AND RESTARTS SSH   #
#############################################

# Prompt user for desired port
echo ""
echo -n "Please enter the port you would like SSH to run on > "
while read SSHPORT; do
	if [[ "$SSHPORT" =~ ^[0-9]{2,5}$ || "$SSHPORT" = 22 ]]; then
		if [[ "$SSHPORT" -ge 1024 && "$SSHPORT" -le 65535 || "$SSHPORT" = 22 ]]
		# Create backup of current SSH config
		NOW=$(date +"%m_%d_%Y-%H_%M_%S")
		cp /etc/ssh/sshd_config /etc/ssh/sshd_config.inst.bckup.$NOW
		# Apply changes to sshd_config
		sed -i -e "/Port /c\Port $SSHPORT" /etc/ssh/sshd_config
		echo -e "Restarting SSH in 5 seconds. Please wait.\n"
		sleep 5
		# Restart SSH service
		service sshd restart
		echo ""
		echo -e "The SSH port has been changed to $SSHPORT. Please login using that port to test BEFORE ending this session.\n"
		exit 0
	else
		echo -e "Invalid port: must be numeric!"
		echo -n "Please enter the port you would like SSH to run on > "
	fi
done

echo ""