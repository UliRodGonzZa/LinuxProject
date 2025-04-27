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
    # Método 2: usar /proc/uptime como emergencia (menos exacto)
    echo -e "${amarillo}Advertencia:${reset} No se encontró /proc/driver/rtc."
    echo -e "${verde}Sistema iniciado hace:${reset}"
    awk '{print int($1/3600)":"int(($1%3600)/60)" horas:minutos desde el arranque."}' /proc/uptime
fi

echo -e "${amarillo}==================================================${reset}"
