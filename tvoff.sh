#!/bin/bash
echo "standby 0" | cec-client -s > /dev/null
echo "standby" > /var/lib/pantalles/tvstatus
killall chromium-browser
killall chromium
#Apaguem HDMI
# Comprovem si la comanda vcgencmd existeix, llavors estem a
# RPi i així no perdem CEC
if command -v vcgencmd &> /dev/null
then
    vcgencmd display_power 0
else 
    xset -display :0.0 dpms force off
fi

