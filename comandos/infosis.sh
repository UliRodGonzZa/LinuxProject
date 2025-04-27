#1/bin/bash

#Script infosis.sh
#Muestra informacion básica del sistema: RAM, arquitectura y la vesrión de SO

#Colores

verde="\e[32m"
amarillo="\e[33m"
reset="\e[0m"

echo -e "${amarillo}======= INFORMACIÓN DEL SISTEMA =======${reset}"

# Muestra memoria RAM total
echo -e "${verde}Memoria RAM:${reset}"
grep MemTotal /proc/meminfo | awk '{print $2/1024 " MB"}'

# Muestra la arquitectura del sistema
echo -e "\n${verde}Arquitectura del Sistema:${reset}"
uname -m

# Muestra la versión del sistema operativo
echo -e "\n${verde}Versión del Sistema Operativo:${reset}"
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'

echo -e "${amarillo}============================================${reset}"