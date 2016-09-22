# Clean Up thankuohoh compromise in FreePBX

This script will attempt to clean up the compromise described here:

http://community.freepbx.org/t/i-ve-been-hacked-macro-thanku-outcall-thankuohoh/32897

This by no means is a 'smart' script, and you will need to verify that things are cleaned up manually. Also a good idea to check /etc/passwd and /etc/shadow for rogue accounts.

Basically, YMMV.

This script will go ahead and upgrade all modules - if you have a lot of module updates available this may take some time. Also, some module updates (like ucp) will take a long time to run if they are updating SQL tables.

Login to SSH as the root user and run:

    bash <(curl -Ls https://git.io/vi5dX)
