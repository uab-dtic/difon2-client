#!/bin/bash
#Encenem HDMI
#
# Comprovem si la comanda vcgencmd existeix, llavors estem a
# RPi i així no perdem CEC
if command -v vcgencmd &> /dev/null
then
    vcgencmd display_power 1
else 
    xset -display :0.0 dpms force on
fi

echo "on 0" | cec-client -s > /dev/null
echo "on" > /var/lib/pantalles/tvstatus

CHROMIUM_INSTS=`ps -ef | grep chromium | wc -l`

if [ "$CHROMIUM_INSTS" -eq 1 ]; then
  /home/pi/scripts/kiosk.sh&
fi
