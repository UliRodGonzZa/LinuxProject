#!/bin/bash

# Script fecha.sh 
# Muestra la fecha y la hora actuales sin usar 'date'

# Colores
verde="\e[32m"
amarillo="\e[33m"
reset="\e[0m"

echo -e "${amarillo}========= FECHA Y HORA DEL SISTEMA =========${reset}"
 #En la distribucion de ubuntu nueva la direccion /proc/driver/rtc es para usuarios root

# Revisamos si existe /proc/driver/rtc y si tiene contenido
if [ -s /proc/driver/rtc ]; then
    fecha=$(grep rtc_date /proc/driver/rtc | awk '{print $2}')
    hora=$(grep rtc_time /proc/driver/rtc | awk '{print $2}')
    
    if [ -n "$fecha" ] && [ -n "$hora" ]; then
        echo -e "${verde}Fecha actual:${reset} $fecha"
        echo -e "${verde}Hora actual:${reset} $hora"
    else
        echo -e "${amarillo}Advertencia:${reset} /proc/driver/rtc vacío. Mostrando tiempo encendido:"
        awk '{print int($1/3600)" horas y "int(($1%3600)/60)" minutos desde encendido."}' /proc/uptime
    fi
else
    echo -e "${amarillo}Advertencia:${reset} No existe /proc/driver/rtc. Mostrando tiempo encendido:"
    awk '{print int($1/3600)" horas y "int(($1%3600)/60)" minutos desde encendido."}' /proc/uptime
fi

echo -e "${amarillo}=============================================${reset}"
