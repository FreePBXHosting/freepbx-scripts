# Optimize Apache Memory Usage in FreePBX

This script will change the StartServers, MinSpareServers, MaxSpareServers, and MaxClients variables in /etc/httpd/conf/httpd.conf and gracefully restart Apache. Login to SSH as the root user and run:

    bash <(curl -Ls http://git.io/vIFQD)