#!/bin/bash

clear
echo "Bienvenido a la Terminal"

# ========================> LOGIN

source login/login.sh

# Si pasa el login, sigue aquí...

# ========================> MENU

mostrar_ayuda() {
    echo ""
    echo "=== AYUDA ==="
    echo "Opciones disponibles:"
    echo "1) Ayuda"
    echo "2) Información del sistema"
    echo "3) Fecha y hora"
    echo "4) Buscar archivo"
    echo "5) Créditos"
    echo "6) Juego"
    echo "7) Música"
    echo "8) Salir"
}

# ========================> MENU


while true; do
    echo ""
    echo "=== MENÚ PRINCIPAL ==="
    echo "Usuario actual: $usuario"
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
    read -p "Selecciona una opción: " opcion

    case $opcion in
        1) mostrar_ayuda ;;
        2) mostrar_sistema ;;
        3) mostrar_fecha ;;
        4) buscar_archivo ;;
        5) source creditos/creditos.sh  ;;
        6) ejecutar_juego ;;
        7) reproductor_musica ;;
        8) echo "Saliendo... ¡Hasta luego, $usuario!"; exit 0 ;;
        *) echo "Opción inválida. Intenta de nuevo." ;;
    esac
done
