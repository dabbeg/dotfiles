#!/bin/sh

STATUS=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1 | head -n 1)

if [ "$STATUS" != "" ]; then
    echo "%{F#555}%{F-}  %{F#82E0AA}%{A1:openvpn d:}$STATUS%{A}%{F-}"
else
    echo "%{F#555}%{F-}  %{F#f00}%{A1:nordvpn c:}no vpn%{A}%{F-}"
fi
