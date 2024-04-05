#!/bin/bash

# Obtener el porcentaje de volumen actual
percentage=$(pactl list sinks | grep 'Volume:' | grep -E -o '[0-9]+%' | head -n 1 | sed 's/%//')

# Si el porcentaje supera el 100%, establecerlo en 100%
if [ $percentage -gt 100 ]; then
    percentage=100
fi

echo $percentage%

