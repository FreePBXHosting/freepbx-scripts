# Change the SSH port on a FreePBX server

To run the script, login as root via SSH and run the following command:

    bash <(curl -Ls http://git.io/vIF5s)

We recommend choosing an unused port over 1024 (but less than 65535).

**Once you have changed the SSH port, remember to test to make sure you're able to SSH to your server using the new port *before* closing the current SSH session.**