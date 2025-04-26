#!/bin/bash


# Definicion de colores
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # Color para Reset

# Funcion para escribir como maquina de escribir
escribir_lento() {
    texto="$1"
    velocidad=${2:-0.02}
    for (( i=0; i<${#texto}; i++ )); do
        echo -n "${texto:$i:1}"
        sleep $velocidad
    done
    echo ""
}

clear
echo -e "${CYAN}======================================"
escribir_lento "   Bienvenido a la Terminal de Trabajo" 0.02
echo -e "======================================${NC}"
echo ""

# Pedir usuario
echo -e "${YELLOW}Usuario del sistema:${NC}"
read -p "> " usuario
echo ""

# Verificar existencia
if id "$usuario" &>/dev/null; then
    echo -e "${GREEN}[✓] Usuario encontrado.${NC}"
else
    echo -e "${RED}[✗] Error: El usuario '$usuario' no existe en el sistema.${NC}"
    exit 1
fi
echo ""

# Pedir contraseña
echo -e "${YELLOW}Contraseña:${NC}"
read -s -p "> " contrasena
echo -e "\n"

# Validar con pamtester
echo "$contrasena" | pamtester login "$usuario" authenticate > /dev/null 2>&1
RESULTADO=$?

# Verificamos los datos de usuario con su password
if [ $RESULTADO -eq 0 ]; then
    echo -e "${GREEN}"
    escribir_lento "[✓] Acceso concedido. Bienvenido $usuario" 0.02
    echo -e "${NC}"
else
    echo -e "${RED}[✗] Error: Contraseña incorrecta o fallo de autenticacion. Saliendo...${NC}"
    exit 1
fi

