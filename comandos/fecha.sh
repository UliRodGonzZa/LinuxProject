#!/bin/bash

# Script fecha.sh
# Muestra la fecha y hora del sistema, ajustada al huso horario de CDMX, con arte ASCII.

mostrar_fecha() {
    clear

    # Mostrar título
    echo ""
    toilet -f smblock "Fecha y Hora del Sistema" | boxes -d stone | lolcat -a -d 2
    echo ""

    # Obtener fecha y hora
    if [ -f /proc/driver/rtc ]; then
        fecha=$(grep "rtc_date" /proc/driver/rtc | sed 's/rtc_date[ \t]*:[ \t]*//')
        hora=$(grep "rtc_time" /proc/driver/rtc | sed 's/rtc_time[ \t]*:[ \t]*//')

        IFS='-' read -r anio mes dia <<< "$fecha"
        IFS=':' read -r h m s <<< "$hora"

        h_corrigida=$(( (10#$h - 6 + 24) % 24 ))
        hora_mexico=$(printf "%02d:%02d:%02d" "$h_corrigida" "$m" "$s")
    else
        fecha_hora=$(date "+%d/%m/%Y %H:%M:%S")
        hora_mexico="$fecha_hora"
        h_corrigida=$(date "+%H")
    fi

    hora_sistema=$(date "+%H:%M:%S")

    echo ""
    cat << EOF | lolcat -a -d 2
Hora del Sistema: $hora_sistema
Hora Ciudad de México: $hora_mexico
EOF
    echo ""

    # Mostrar imagen dependiendo de hora
    if [ "$h_corrigida" -ge 6 ] && [ "$h_corrigida" -lt 18 ]; then
        # Día
        cat << "EOF" | lolcat -a -d 2
            .   
        .   :   .  
    '.   .  :  .   .'
 ._   '._.-'''-._.'   _.
   '-..'         '..-' 
--._ /.==.     .==.\ _.--
    ;/_o__\   /_o__\;
----|`     ) (     `|----
   _: \_) (\_/) (_/ ;_
--'  \  '._.=._.'  /  '-- 
  _.-'''.  '._.'  .'''-._
 '    .''-.(_).-.''    '
      .'   '  :  '   '.
         '    :   '
EOF
    else
        # Noche
        cat << "EOF" | lolcat -a -d 2
(Noche: Imagen de estrellas muy grande)
EOF
    fi

    echo ""
    read -p "Presiona ENTER para volver al menú..."
}

# Ejecutar función
mostrar_fecha
