#!/bin/sh
sleep 0.5
WS=/home/davidh/dotfiles/scripts/adjust_monitors.sh
MONITOR_COUNT=$(XAUTHORITY=/home/davidh/.Xauthority xrandr --current -d :0| grep connected | grep -v disconnected | wc -l)

CRAZY=$4
echo "CRAZY $CRAZY" >> /tmp/docklogger

if [ "$CRAZY" != "00006030" ]; then
    exit 0
fi

echo "$@" >> /tmp/docklogger
echo "MONITOR_COUNT $MONITOR_COUNT" >> /tmp/docklogger

case "$MONITOR_COUNT" in
    "1")
        XAUTHORITY=/home/davidh/.Xauthority XRANDR_FLAGS="-d :0" $WS laptop >> /tmp/docklogger 2>&1
        ;;
    "2")
        XAUTHORITY=/home/davidh/.Xauthority XRANDR_FLAGS="-d :0" $WS home >> /tmp/docklogger 2>&1
        ;;
    "3")
        XAUTHORITY=/home/davidh/.Xauthority XRANDR_FLAGS="-d :0" $WS work >> /tmp/docklogger 2>&1
        ;;
esac
exit 0

### /etc/acpi/handler.sh
#!/bin/bash
# Default acpi script that takes an entry for all actions

# case "$1" in
#     button/power)
#         case "$2" in
#             PBTN|PWRF)
#                 logger 'PowerButton pressed'
#                 ;;
#             *)
#                 logger "ACPI action undefined: $2"
#                 ;;
#         esac
#         ;;
#     button/sleep)
#         case "$2" in
#             SLPB|SBTN)
#                 logger 'SleepButton pressed'
#                 ;;
#             *)
#                 logger "ACPI action undefined: $2"
#                 ;;
#         esac
#         ;;
#     ac_adapter)
#         case "$2" in
#             AC|ACAD|ADP0)
#                 case "$4" in
#                     00000000)
#                         logger 'AC unpluged'
#                         ;;
#                     00000001)
#                         logger 'AC pluged'
#                         ;;
#                 esac
#                 ;;
#             *)
#                 logger "ACPI action undefined: $2"
#                 ;;
#         esac
#         ;;
#     battery)
#         case "$2" in
#             BAT0)
#                 case "$4" in
#                     00000000)
#                         logger 'Battery online'
#                         ;;
#                     00000001)
#                         logger 'Battery offline'
#                         ;;
#                 esac
#                 ;;
#             CPU0)
#                 ;;
#             *)  logger "ACPI action undefined: $2" ;;
#         esac
#         ;;
#     button/lid)
#         case "$3" in
#             close)
#                 logger 'LID closed'
#                 ;;
#             open)
#                 logger 'LID opened'
#                 ;;
#             *)
#                 logger "ACPI action undefined: $3"
#                 ;;
#         esac
#         ;;
#     ibm/hotkey)
#         /home/davidh/dotfiles/scripts/hotkey.sh "$@"
#   ;;
#     *)
#         logger "ACPI group/action undefined: $1 / $2"
#         ;;
# esac

# # vim:set ts=4 sw=4 ft=sh et:
