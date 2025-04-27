#!/bin/bash

# Script juego.sh
# Juego de Ahorcado

# Colores
verde="\e[32m"
rojo="\e[31m"
amarillo="\e[33m"
reset="\e[0m"

# Palabras a adivinar
palabras=("bash" "linux" "terminal" "sistema" "programa")

# Eleccion de palabra aleatoria
palabra=${palabras[$RANDOM % ${#palabras[@]}]}
longitud=${#palabra}
vidas=6
guiones=$(printf '_%.0s' $(seq 1 $longitud))

# Función para mostrar el estado actual
mostrar_estado() {
    echo -e "${amarillo}Palabra:${reset} $guiones"
    echo -e "${amarillo}Vidas restantes:${reset} $vidas"
}

while [ $vidas -gt 0 ]; do
    clear
    echo -e "${verde}===== AHORCADO =====${reset}"
    mostrar_estado

    echo -n "Ingresa una letra: "
    read letra

    # Validar que haya ingresado solo una letra
    if [[ ! $letra =~ ^[a-zA-Z]$ ]]; then
        echo -e "${rojo}Por favor, ingresa solo UNA letra válida.${reset}"
        sleep 1
        continue
    fi

    letra=$(echo "$letra" | tr '[:upper:]' '[:lower:]') # Convertir a minúscula
    nueva_guiones=""
    acierto=0

    for ((i=0; i<$longitud; i++)); do
        if [ "${palabra:$i:1}" == "$letra" ]; then
            nueva_guiones="${nueva_guiones}${letra}"
            acierto=1
        else
            nueva_guiones="${nueva_guiones:${#nueva_guiones}}${guiones:$i:1}"
        fi
    done

    if [ $acierto -eq 1 ]; then
        guiones=$nueva_guiones
        echo -e "${verde}¡Bien! La letra está en la palabra.${reset}"
    else
        ((vidas--))
        echo -e "${rojo}Fallaste, pierde una vida.${reset}"
    fi

    # Comprobar si ganó
    if [ "$guiones" == "$palabra" ]; then
        echo -e "${verde}¡Felicidades! Adivinaste la palabra: ${palabra}${reset}"
        break
    fi

    sleep 1
done

if [ $vidas -eq 0 ]; then
    echo -e "${rojo}¡Perdiste! La palabra era: ${palabra}${reset}"
fi

echo -e "${amarillo}Fin del juego.${reset}"
