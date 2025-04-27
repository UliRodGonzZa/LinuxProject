#!/bin/bash

# Script buscar.sh
# Busca un archivo dentro de un directorio específico

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Validar que se reciban 2 argumentos
if [ $# -ne 2 ]; then
    echo -e "${rojo}Error:${reset} Uso correcto: buscar.sh <directorio> <archivo>"
    exit 1
fi

directorio="$1"
archivo="$2"

# Verificar si el directorio existe
if [ ! -d "$directorio" ]; then
    echo -e "${rojo}Error:${reset} El directorio '$directorio' no existe."
    exit 1
fi

# Realizar la búsqueda
resultado=$(find "$directorio" -type f -name "$archivo")

if [ -n "$resultado" ]; then
    echo -e "${verde}Archivo encontrado:${reset}"
    echo "$resultado"
else
    echo -e "${amarillo}Archivo no encontrado.${reset}"
fi
