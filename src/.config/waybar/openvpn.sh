#!/bin/sh

STATUS=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 | head -n 1)

if [ "$STATUS" != "" ]; then
    echo '{"text": "ON", "tooltip": "status: running", "class": "enabled" }'
else
    echo '{"text": "OFF", "tooltip": "status: stopped", "class": "disabled" }'
fi
