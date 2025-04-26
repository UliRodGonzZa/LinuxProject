#!/bin/bash

# =========================
# Script de Creditos Final
# =========================

# Definicion de colores
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # Resetea el color que estabamos utilizando

# Bloque de texto que muestra datos generales de nuestro proyecto
texto="Escuela de procedencia: Universidad Nacional Autonoma de Mexico (UNAM)
Carrera estudiada: Ingenieria en Computacion
Repositorio del proyecto: https://github.com/UliRodGonzZa/LinuxProject

Descripcion del proyecto:
El proyecto consiste en una terminal de trabajo desarrollada en Bash con el fin de mejorar las habilidades en un SO Linux.

Derechos reservados:
Este proyecto es propiedad de sus autores, y esta protegido bajo las leyes de derechos de autor correspondientes.
Queda prohibida la reproduccion parcial o total sin el consentimiento de sus desarrolladores.

Motivacion y agradecimiento para: Ximena Alessandra"

texto2="→ Tareas designadas: Programacion de login, menu principal,creditos documentacion tecnica."
texto3="→ Tareas designadas: Desarrollo de modulos de juego,reproductor de musica."

# Vamos al directorio donde está este script

# Creamos carpeta temporal para que otro usuario no tenga problemas al ejecutar
mkdir -p creditos/ascii_temp

# Convertir imagen Ding.png a ASCII
jp2a --width=60 creditos/imagenes/Ding.png > creditos/ascii_temp/Ding_ascii.txt

# Convertir imagen Polar.png a ASCII
jp2a --width=60 creditos/imagenes/Polar.png > creditos/ascii_temp/Polar_ascii.txt

# Funcion para mostrar ASCII de las imagenes seleccionadas
mostrar_ascii1() {
    echo ""
    cat creditos/ascii_temp/Ding_ascii.txt | lolcat -a -d 1
}

mostrar_ascii2() {
    echo ""
    cat creditos/ascii_temp/Polar_ascii.txt | lolcat -a -d 1
}

clear

# Mostrar encabezado
figlet "==> CREDITOS <==" | lolcat -a -d 2

echo -e "${WHITE}"

# Bucle para imprimir letra por letra -> Efecto Maquina de Escribir
for (( i=0; i<${#texto}; i++ )); do
    echo -n "${texto:$i:1}"
    sleep 0.01
done

echo ""
# Resetea color al final
echo -e "${NC}"

# Mostrar Datos de Rodrigo
echo ""
toilet -f smblock "Gonzalez Zavala Ulises Rodrigo" | boxes -d stone | lolcat -a -d 3
echo ""
echo -e "${WHITE}"

# Bucle para imprimir letra por letra -> Efecto Maquina de Escribir
for (( i=0; i<${#texto2}; i++ )); do
    echo -n "${texto2:$i:1}"
    sleep 0.01
done


# Mostrar imagen de Rodrigo
mostrar_ascii1

# Mostrar Datos de Carlo
echo ""
toilet -f smblock "Carlo Magno Romero Calixto" | boxes -d stone | lolcat -a -d 3
echo ""
echo -e "${WHITE}"

# Bucle para imprimir letra por letra -> Efecto Maquina de Escribir
for (( i=0; i<${#texto3}; i++ )); do
    echo -n "${texto3:$i:1}"
    sleep 0.01
done


# Mostrar imagen de Carlo
mostrar_ascii2

# Mostrar nombre de la empresa
echo ""
toilet -f smblock "   PROTECSA   " | boxes -d stone | lolcat -a -d 10

# Esperar para volver al menu
echo ""
read -p "Presiona ENTER para volver al menu principal..."
clear # Limpiamos Pantalla al Final

