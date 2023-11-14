#!/bin/bash
####################################################################
# Script per optenir l'estat del client des del servidor
# Codis d'error:
#     Codi de wget en cas d'error amb el server
#     -2 en cas de resposta del server desconeguda

# Obtenim la interface de xaxa
INTER=`ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2;getline}'`

# Obtenim la MAC address
MAC=`ifconfig $INTER | grep -o -E '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}'`

# Guardem l'estat de la pantalla que ens diu CEC
ESTPANT=`timeout 20s bash -c "echo scan |cec-client -s -d 1|head -n 13 |grep 'power' |cut  -d' ' -f4"

if [ "$?" -eq 124 ]; then
#Ha sortit per timeout
  logger "DIFON: $0: Pantalla triga massa en donar el seu estat. Codi d'error: 124"
fi

if ["$ESTPANT" -eq ""]; then 
  ESTPANT="unknown"
fi

echo $ESTPANT > /var/lib/pantalles/tvstatus

STATUS=`wget --timeout=10 -qO- --post-data="pantalla=$ESTPANT&mac=$MAC" https://difont.uab.cat/getstatus.php`

if [ "$?" -gt 0 ]; then
#Ha hagut algun error amb wget getstatus
  logger "DIFON: $0: Error en petició al servidor. Codi d'error: $?"
  exit $?
fi

case $STATUS in

  00)
    echo "No hago nada"
  ;;

  10)
    echo "Apagar Cliente"
  ;;

  01)
    echo "Apagar Pantalla"
  ;;

  02)
    echo "Encender Pantalla"
  ;;

  03)
    echo "Reiniciar Cliente"
  ;;

  *)
    echo "No hacer nada"
    logger "DIFON: $0: Error en resposta del servidor. Codi d'error: -2"
    exit -2
  ;;
esac
