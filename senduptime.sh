#!/bin/bash
####################################################################
# Script per enviar al servidor des de quan ha arrencat
# El format és YYYY-MM-DD hh:mm:ss Ex: 2023-11-10 08:55:06

UPTIME=`uptime -s`

STATUS=`wget --timeout=10 -qO- --post-data="data=$UPTIME" https://difont.uab.cat/setuptime`

if [ "$?" -gt 0 ]; then
#Ha hagut algun error amb wget setuptime
  logger "DIFON: $0: Error en petició al servidor. Codi d'error: $?"
  exit $?
fi

#Clonem el repositori de scripts
git clone https://github.com/uab-dtic/difon2-client.git /home/pi/scripts
chmod +x /home/pi/scripts/*.sh

exit 0