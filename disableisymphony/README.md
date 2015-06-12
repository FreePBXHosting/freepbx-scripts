# Disable iSymphony in FreePBX

To disable iSymphony, login to the server with SSH as the root user and run the following command:

    bash <(curl -Ls http://git.io/vIb4L)
	
This script will check to see which version of iSymphony is installed and disable it. iSymphony uses a lot of memory, so disabling it when it's not in use is a good idea.

If you decide you would like to enable iSymphony, run this script:

    bash <(curl -Ls http://git.io/vIbru)