#!/bin/bash

# Script fecha.sh adaptado
# Muestra la fecha y la hora actuales SIN usar 'date'

# Colores
verde="\e[32m"
amarillo="\e[33m"
reset="\e[0m"

echo -e "${amarillo}========= FECHA Y HORA DEL SISTEMA =========${reset}"

# Intentamos leer la información desde /proc/driver/rtc

if [ -f /proc/driver/rtc ]; then
    fecha=$(grep rtc_date /proc/driver/rtc | awk '{print $2}')
    hora=$(grep rtc_time /proc/driver/rtc | awk '{print $2}')
    
    if [ -z "$fecha" ] || [ -z "$hora" ]; then
        # El archivo existe pero está vacío
        echo -e "${amarillo}Advertencia:${reset} /proc/driver/rtc está vacío, mostrando tiempo desde el encendido."
        awk '{print int($1/3600)" horas y "int(($1%3600)/60)" minutos desde el encendido."}' /proc/uptime
    else
        echo -e "${verde}Fecha actual:${reset} $fecha"
        echo -e "${verde}Hora actual:${reset} $hora"
    fi
else
    #En la distribucion de ubuntu nueva la direccion /proc/driver/rtc es para usuarios root

    # Como alternativa
    echo -e "${amarillo}Advertencia:${reset} No se encontró /proc/driver/rtc."
    echo -e "${verde}Sistema encendido hace:${reset}"
    awk '{print int($1/3600)" horas y "int(($1%3600)/60)" minutos"}' /proc/uptime
fi

echo -e "${amarillo}=============================================${reset}"
