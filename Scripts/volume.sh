#!/bin/bash

# Función para mostrar el uso correcto del script
usage() {
    echo "Uso: $0 [up|down]"
    exit 1
}

# Verificar si se proporciona el argumento correcto
if [ $# -ne 1 ]; then
    usage
fi

# Verificar si el argumento es "up" o "down"
if [ "$1" != "up" ] && [ "$1" != "down" ]; then
    usage
fi

# Ajustar el volumen utilizando amixer
if [ "$1" = "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +10%
elif [ "$1" = "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -10%
fi

exit 0

