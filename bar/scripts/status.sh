#!/bin/bash

export LC_TIME="en_US.UTF-8"
DATE=$(date +"%a %b %d, %Y")
TIME=$(date +"%H:%M:%S")

BATTERY_PERCENTAGE=$(pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d'%')
BATTERY_STATUS=$(pmset -g batt | grep "'.*'" | sed "s/'//g" | cut -c 18-19)
BATTERY_REMAINING=$(pmset -g batt | egrep -o '([0-9]+%).*' | cut -d\  -f3)

BATTERY_CHARGING=""
if [ "$BATTERY_STATUS" == "Ba" ]; then
  BATTERY_CHARGING="false"
elif [ "$BATTERY_STATUS" == "AC" ]; then
  BATTERY_CHARGING="true"
fi

VOLUME=$(osascript -e 'set ovol to output volume of (get volume settings)')

WIFI_STATUS=$(ifconfig en0 | grep status | cut -c 10-)
WIFI_SSID=$(networksetup -getairportnetwork en0 | cut -c 24-)
WIFI_IP=$(ipconfig getifaddr en0)

LAN_STATUS=$(ipconfig getifaddr en8)

echo $(cat <<-EOF
{
  "volume": "$VOLUME",
  "datetime": {
    "date": "$DATE",
    "time": "$TIME"
  },
  "battery": {
    "percentage": $BATTERY_PERCENTAGE,
    "charging": $BATTERY_CHARGING,
    "remaining": "$BATTERY_REMAINING"
  },
  "wifi": {
    "status": "$WIFI_STATUS",
    "ssid": "$WIFI_SSID",
    "ip": "$WIFI_IP"
  },
  "lan": "$LAN_STATUS"
}
EOF
)
