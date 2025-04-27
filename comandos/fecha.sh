#!/bin/bash

# Script fecha.sh
# Muestra la fecha y la hora actuales sin utilizar el comando'date'

# Colores
verde="\e[32m"
amarillo="\e[33m"
reset="\e[0m"

echo -e "${amarillo}============ FECHA Y HORA DEL SISTEMA ============${reset}"

# Usamos el archivo /proc/driver/rtc para obtener la fecha y la hora

if [ -f /proc/driver/rtc ]; then
    fecha=$(grep rtc_date /proc/driver/rtc | awk '{print $2}')
    hora=$(grep rtc_time /proc/driver/rtc | awk '{print $2}')
    echo -e "${verde}Fecha actual:${reset} $fecha"
    echo -e "${verde}Hora actual:${reset} $hora"
else
    echo -e "${rojo}No se pudo obtener la fecha y hora del sistema.${reset}"
fi

echo -e "${amarillo}==================================================${reset}"
