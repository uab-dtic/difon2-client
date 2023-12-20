#!/bin/bash
#Encenem HDMI
xset -display :0.0 dpms force on
echo "on 0" | cec-client -s > /dev/null
echo "on" > /var/lib/pantalles/tvstatus
/home/pi/scripts/kiosk.sh&
