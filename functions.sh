#!/bin/bash

procesa_status() {

  ACCIO_PC=${1:0:1}
  ACCIO_PANT=${1:1:2}

case $ACCIO_PC in

  0)
    echo "No hago nada"
    logger "DIFON: $0: No faig res"
  ;;

  1)
    #echo "Apagar Client"
    logger "DIFON: $0: Apagar Client"
    sudo poweroff
  ;;

  2)
    echo "Reiniciar Cliente"
    logger "DIFON: $0: Reiniciar PC"
    sudo reboot
  ;;
  8)
    case $ACCIO_PANT in
      0)
          echo "Error data buida"
          logger "DIFON: $0: Error data buida"
      ;;
      1)
          echo "Error en la data rebuda"
          logger "DIFON: $0: Error en la data rebuda"
      ;;
    esac
    exit 0
  ;;

  9)
    case $ACCIO_PANT in
      0)
          echo "Error MAC buida"
          logger "DIFON: $0: Error MAC buida"
      ;;
      1)
          echo "Error en la MAC rebuda"
          logger "DIFON: $0: Error en la MAC rebuda"
      ;;
      2)
          echo "Error MAC no trobada a la BBDD"
          logger "DIFON: $0: Error MAC no trobada a la BBDD"
      ;;
    esac
    exit 0
  ;;

  *)
    echo "No hacer nada"
    logger "DIFON: $0: Error en resposta del servidor. Codi d'error: -2 STATUS: $1"
    exit -2
  ;;
esac

case $ACCIO_PANT in
  1)
    echo "Apagar Pantalla"
    logger "DIFON: $0: Apagar Pantalla"
    /home/pi/scripts/tvoff.sh
  ;;
 
  2)
    echo "Encendre Pantalla"
    logger "DIFON: $0: Encendre Pantalla"
    /home/pi/scripts/tvon.sh
  ;;
esac


}
