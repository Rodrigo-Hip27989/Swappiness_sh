#!/bin/sh
# -*- ENCODING: UTF-8 -*-

config_swappiness()
{
	local opcion_valida="false"
	local consultar_swap=`cat /proc/sys/vm/swappiness`
	local valor_swap=""
	while [ $opcion_valida = "false" ]
	do
	  clear
	  valor_swap=$(dialog --title "CONFIG - SWAPPINESS" \
            --stdout \
            --inputbox "\nUna valor mas alto permite utilizar más swap.\n\nSu valor actual es:\n\nvm.swappiness = $consultar_swap \n\nElige un nuevo valor" 20 38)
      returncode=$?
      if [[ $returncode = 0 ]]; then
        if [[ ($valor_swap != *[^0-9]*) && ($valor_swap != "") ]]; then
          if [[ $valor_swap -ge 0 && $valor_swap -le 100 ]]; then
            opcion_valida="true"
	         local new_value_swappiness=`sudo sysctl vm.swappiness=$valor_swap`
			   mensaje=$(dialog --title "CONFIG - SWAPPINESS" \
					--stdout \
					--msgbox "\n\n Nuevo Valor Actualizado:\n\n $new_value_swappiness\n\n" 10 38)
		      returncode=$?
          else
            opcion_valida="false"
            mensaje=$(dialog --title "CONFIG - SWAPPINESS" \
					--stdout \
					--msgbox "\nIngrese un valor entre 0 y 100\n" 8 42)
		      returncode=$?
          fi
        else
          opcion_valida="false"
          mensaje=$(dialog --title "CONFIG - SWAPPINESS" \
					--stdout \
					--msgbox "\nEl valor ingresado tiene que ser numerico\n" 8 42)
		    returncode=$?
        fi
      else
        opcion_valida="true"
        mensaje=$(dialog --title "CONFIG - SWAPPINESS" \
			  --stdout \
		     --msgbox "\nOperación cancelada\n" 8 42)
		  returncode=$?
      fi
    done
    mensaje=$(dialog --title "CONFIG - SWAPPINESS" \
		--stdout \
	   --msgbox "\nPresione una tecla para continuar...\n" 8 42)
	 returncode=$?
}

config_swappiness
