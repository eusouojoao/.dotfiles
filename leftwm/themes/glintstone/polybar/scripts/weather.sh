#!/bin/bash

disconnected="ﲁ"
ID="$(ip link | awk '/state UP/ {print $2}')"
while true; do
    if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
        if [[ $ID == e* ]]; then
            curl -sf "wttr.in/$1?format=3" ; sleep 1200
        else
            curl -sf "wttr.in/$1?format=3" ; sleep 1200
        fi
    else
        echo "$disconnected Offline" ; sleep 5
    fi
done
