#!/bin/bash

#script ayuda.sh
#muestra todos los comandos disponibles en la terminal 

#colores
verde="\e[32m"
amarillo="\e[33m"
rest="\e[0m"

echo -e "${amarillo}=============== AYUDA ===============${reset}"
echo -e "${verde}Comandos disponibles:${reset}"
echo -e "${verde}ayuda${reset}   -Muestra la lista de comandos." 
echo -e "${verde}infosis${reset}   -Muestra la información del sistema (RAM, arquitectura, SO>
echo -e "${verde}fecha${reset}   -Muestra la fecha y la hora actuales."
echo -e "${verde}buscar <ruta> <archivo>${reset} -Busca un archivo en la carpeta indicada."
echo -e "${verde}creditos${reset}   -Muestra los creditos de los programadores."
echo -e "${verde}juego${reset}   -Ejecuta el juego disponible."
echo -e "${verde}musica${reset}   -Abre el reproductor de música."
echo -e "${verde}salir${reset}   -Cierra la terminal."
echo -e "${amarillo}========================================${reset}"
