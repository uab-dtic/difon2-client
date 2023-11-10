#!/bin/bash
####################################################################
# Script per optenir l'estat del client des del servidor
# Codis d'error:
#     Codi de wget en cas d'error amb el server
#     -2 en cas de resposta del server desconeguda

PANTALLA=`cat /var/lib/pantalles/tvstatus`

STATUS=`wget --timeout=10 -qO- --post-data="pantalla=$PANTALLA" https://difont.uab.cat/getstatus.php`


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

# Guardem l'estat de la pantalla que ens diu CEC
timeout 20s bash -c "echo scan |cec-client -s -d 1|head -n 13 |grep 'power' |cut  -d' ' -f4 > /var/lib/pantalles/tvstatus"

if [ "$?" -eq 124 ]; then
#Ha sortit per timeout
  logger "DIFON: $0: Pantalla triga massa en donar el seu estat. Codi d'error: 124"
  exit $?
fi