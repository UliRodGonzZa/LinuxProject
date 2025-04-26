#!/bin/bash

clear
echo "Bienvenido a la Terminal de Trabajo"

# Pedir usuario
read -p "Usuario del sistema: " usuario

# Verificar existencia
if id "$usuario" &>/dev/null; then
    echo "Usuario encontrado."
else
    echo "Error: El usuario '$usuario' no existe en el sistema."
    exit 1
fi

# Pedir contraseña
read -s -p "Contraseña: " contrasena
echo

# Validar con pamtester
echo "$contrasena" | pamtester login "$usuario" authenticate > /dev/null 2>&1
RESULTADO=$?

# Verificamos los datos de usuario con su password
if [ $RESULTADO -eq 0 ]; then
    echo "Acceso concedido. ¡Bienvenido $usuario!"
else
    echo "Error: Contraseña incorrecta o fallo de autenticación. Saliendo..."
    exit 1
fi

