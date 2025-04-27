#!/bin/bash

# Definición de colores
verde='\e[32m'
amarillo='\e[33m'
rojo='\e[31m'
reset='\e[0m'

clear
echo -e "${amarillo}======================================"
echo -e "    Bienvenido a la Terminal de Trabajo"
echo -e "======================================${reset}"

# ========================> LOGIN

bash login/login.sh
if [ $? -ne 0 ]; then
    echo -e "${rojo}Acceso denegado. Saliendo...${reset}"
    exit 1
fi

# ========================> Funciones del Menú

mostrar_ayuda() {
    bash comandos/ayuda.sh
}

mostrar_sistema() {
    bash comandos/infosis.sh
}

mostrar_fecha() {
    bash comandos/fecha.sh
}

buscar_archivo() {
    echo -e "${amarillo}Introduce la ruta donde buscar:${reset}"
    read ruta
    echo -e "${amarillo}Introduce el nombre del archivo a buscar:${reset}"
    read archivo
    bash comandos/buscar.sh "$ruta" "$archivo"
}

mostrar_creditos() {
    bash creditos/creditos.sh
}

ejecutar_juego() {
    bash juego/juego.sh
}

reproductor_musica() {
    bash musica/musica.sh
}

# ========================> MENÚ PRINCIPAL

while true; do
    echo ""
    echo -e "${verde}=== MENÚ PRINCIPAL ===${reset}"
    echo "Usuario actual: $(whoami)"
    echo "Directorio actual: $(pwd)"
    echo "-----------------------------"
    echo "1) Ayuda"
    echo "2) Información del sistema"
    echo "3) Fecha y hora"
    echo "4) Buscar archivo"
    echo "5) Créditos"
    echo "6) Juego"
    echo "7) Música"
    echo "8) Salir"
    echo "-----------------------------"
    read -p "Selecciona una opción (1-8): " opcion

    case $opcion in
        1) mostrar_ayuda ;;
        2) mostrar_sistema ;;
        3) mostrar_fecha ;;
        4) buscar_archivo ;;
        5) mostrar_creditos ;;
        6) ejecutar_juego ;;
        7) reproductor_musica ;;
        8) echo -e "${amarillo}Saliendo... ¡Hasta luego!${reset}"; exit 0 ;;
        *) echo -e "${rojo}Opción inválida. Intenta de nuevo.${reset}" ;;
    esac
done
