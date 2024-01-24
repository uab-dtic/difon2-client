#!/bin/bash
echo "standby 0" | cec-client -s > /dev/null
echo "standby" > /var/lib/pantalles/tvstatus
killall chromium-browser
#Apaguem HDMI
#xset -display :0.0 dpms force off
vcgencmd display_power 0
