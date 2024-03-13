#!/bin/bash
#Encenem HDMI
#xset -display :0.0 dpms force on
vcgencmd display_power 1
echo "on 0" | cec-client -s > /dev/null
echo "on" > /var/lib/pantalles/tvstatus

CHROMIUM_INSTS=`ps -ef | grep chromium | wc -l`

if [ "$CHROMIUM_INSTS" -eq 1 ]; then
  /home/pi/scripts/kiosk.sh&
fi
