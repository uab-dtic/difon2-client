procesa_status() {

case $1 in

  00)
    echo "No hago nada"
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
    #echo "Apagar Pantalla"
    logger "DIFON: $0: Apagar Pantalla"
    /home/pi/scripts/tvoff.sh
  ;;

  02)
    #echo "Encendre Pantalla"
    logger "DIFON: $0: Encendre Pantalla"
    /home/pi/scripts/tvon.sh
  ;;

  *)
    echo "No hacer nada"
    logger "DIFON: $0: Error en resposta del servidor. Codi d'error: -2"
    exit -2
  ;;
esac

}