#!/bin/bash

x11vnc &
/home/pi/novnc/utils/novnc_proxy  --vnc localhost:5900 --ssl-only --cert /home/pi/novnc/certificate.pem --key /home/pi/novnc/key.pem &

PR=$!

#Esperem 5 minuts per desactivar el servei
sleep 300

pkill -P $PR

for PROCESO in `ps -ef |grep websockify | tr -s ' ' | cut -d ' ' -f 2`
do
    kill -9 $PROCESO
done
