#!/bin/bash

# Script musica.sh
# Reproductor de música básico en Bash usando mpg123

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Verificar si mpg123 está instalado
if ! command -v mpg123 &> /dev/null; then
    echo -e "${rojo}El programa 'mpg123' no está instalado.${reset}"
    echo -n -e "${amarillo}¿Deseas instalarlo ahora? (s/n): ${reset}"
    read respuesta
    if [[ "$respuesta" == "s" || "$respuesta" == "S" ]]; then
        sudo apt update
        sudo apt install mpg123
    else
        echo -e "${rojo}No se puede ejecutar el reproductor sin mpg123.${reset}"
        exit 1
    fi
fi

# Carpeta de música (puedes cambiarla si quieres)
musica_dir="$HOME/Música"

# Verificar que la carpeta exista
if [ ! -d "$musica_dir" ]; then
    echo -e "${rojo}La carpeta de música no existe: $musica_dir${reset}"
    exit 1
fi

# Buscar archivos MP3
mapfile -t canciones < <(find "$musica_dir" -type f -name "*.mp3")

# Verificar que haya canciones
if [ ${#canciones[@]} -eq 0 ]; then
    echo -e "${rojo}No se encontraron archivos MP3 en la carpeta: $musica_dir${reset}"
    exit 1
fi

# Menú para seleccionar canción
while true; do
    clear
    echo -e "${verde}===== REPRODUCTOR DE MÚSICA =====${reset}"
    echo -e "${amarillo}Canciones disponibles:${reset}"

    for i in "${!canciones[@]}"; do
        echo "$i) $(basename "${canciones[$i]}")"
    done

    echo -e "${amarillo}Seleccione el número de la canción para reproducirla (o escriba 'salir' para terminar):${reset}"
    read opcion

    if [[ "$opcion" == "salir" ]]; then
        echo -e "${verde}¡Hasta luego!${reset}"
        break
    fi

    if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt "${#canciones[@]}" ]; then
        clear
        echo -e "${verde}Reproduciendo:${reset} $(basename "${canciones[$opcion]}")"
        mpg123 "${canciones[$opcion]}"
    else
        echo -e "${rojo}Opción no válida.${reset}"
        sleep 1
    fi
done
