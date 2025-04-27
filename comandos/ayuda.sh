#!/bin/bash

#script ayuda.sh
#muestra todos los comandos disponibles en la terminal 

#colores
verde="\e[32m"
amarillo="\e[33m"
rest="\e[0m"

echo -e "${amarillo}=============== AYUDA ===============${reset}"
echo -e "${verde}Comandos disponibles:${reset}"
echo -e "${verde}ayuda${reset}        - Muestra la lista de comandos."
echo -e "${verde}infosis${reset}      - Muestra información del sistema (RAM, arquitectura, SO)."
echo -e "${verde}fecha${reset}        - Muestra la fecha y la hora actuales (o tiempo encendido)."
echo -e "${verde}buscar \<ruta\> \<archivo\>${reset} - Busca un archivo en la carpeta indicada."
echo -e "${verde}creditos${reset}     - Muestra los créditos del proyecto."
echo -e "${verde}juego${reset}        - Ejecuta el juego del ahorcado."
echo -e "${verde}musica${reset}       - Abre el reproductor de música MP3."
echo -e "${verde}salir${reset}        - Cierra la terminal de trabajo."
echo -e "${amarillo}===================================${reset}"

