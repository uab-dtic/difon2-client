#!/bin/bash

procesa_status() {

case $1 in

  00)
    echo "No hago nada"
    logger "DIFON: $0: No faig res"
  ;;

  10)
    #echo "Apagar Client"
    logger "DIFON: $0: Apagar Client"
    sudo poweroff
  ;;

  20)
    echo "Reiniciar Cliente"
    logger "DIFON: $0: Reiniciar PC"
    sudo reboot
  ;;

  01)
    echo "Apagar Pantalla"
    logger "DIFON: $0: Apagar Pantalla"
    /home/pi/scripts/tvoff.sh
  ;;

  02)
    echo "Encendre Pantalla"
    logger "DIFON: $0: Encendre Pantalla"
    /home/pi/scripts/tvon.sh
  ;;

  80)
    echo "Error data buida"
    logger "DIFON: $0: Error data buida"
  ;;

  81)
    echo "Error en la data rebuda"
    logger "DIFON: $0: Error en la data rebuda"
  ;;

  90)
    echo "Error MAC buida"
    logger "DIFON: $0: Error MAC buida"
  ;;

  91)
    echo "Error en la MAC rebuda"
    logger "DIFON: $0: Error en la MAC rebuda"
  ;;

  92)
    echo "Error MAC no trobada a la BBDD"
    logger "DIFON: $0: Error MAC no trobada a la BBDD"
  ;;

  *)
    echo "No hacer nada"
    logger "DIFON: $0: Error en resposta del servidor. Codi d'error: -2 STATUS: $1"
    exit -2
  ;;
esac

}
