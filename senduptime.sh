#!/bin/bash
####################################################################
# Script per enviar al servidor des de quan ha arrencat
# El format és YYYY-MM-DD hh:mm:ss Ex: 2023-11-10 08:55:06

source functions.sh

#Obtenim la versió
VERSION=`cat version`

UPTIME=`uptime -s`

# Obtenim la MAC address
MAC=`ifconfig $INTER | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`

echo $VERSION
echo $UPTIME
echo $MAC

STATUS=`wget --timeout=10 -qO- --post-data="data=$UPTIME&mac=$MAC&version=$VERSION" https://difont.uab.cat/setuptime`

if [ "$?" -gt 0 ]; then
#Ha hagut algun error amb wget setuptime
  logger "DIFON: $0: Error en petició al servidor. Codi d'error: $?"
  exit $?
fi

procesa_status $STATUS

Actualitzem el repositori de scripts
cd /home/pi/scripts
git fetch
git pull
chmod +x /home/pi/scripts/*.sh

logger "DIFON: $0: Pantalla arrencada el $UPTIME"

exit 0
