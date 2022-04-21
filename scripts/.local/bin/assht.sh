#!/bin/sh

# A script that provides a fast way to autossh tunnels to some tunnel hostsdefined in $HOME/.ssh/config
# In $HOME/.ssh/config there also:
# Host *_tunnel
#     ForkAfterAuthentication yes
#     SessionType none
#     ServerAliveInterval 5
#     ServerAliveCountMax 3
# If use use other style change host_regex to your variant
# On success it exits with error code 1
# On failure maybe too.

host_regex="Host.*_tunnel"

if [ -n "$(command -v autossh)" ];
then
    autosshp=1
else
    autosshp=0
    echo "ERROR: autossh not installed"
    echo "WARNING: fallback to plain ssh"
fi

    
host=$(grep "${host_regex}" "${HOME}/.ssh/config" | awk '{print $2}' | dmenu -i -p "Choose a host to autossh: " -l 10)

case $autosshp in
    0 )
        $TERMINAL -e ssh "${host}"
        ;;
    * )
        $TERMINAL -e autossh -M 0 "${host}"
        ;;
esac


