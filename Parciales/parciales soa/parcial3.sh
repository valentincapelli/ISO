#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Error. Debe ingresar al menos 1 parametro."
    exit 1
fi

inexistentes=0

for ((i=1; i<=$#; i+=2)); do
    ruta=${!i}
    
    if [ -f "$ruta" ]; then
        echo "$ruta es un archivo."
    elif [ -d "$ruta" ]; then
        echo "$ruta es un directorio."
    else
        ((inexistentes++))
    fi

done

echo "La cantidad de inexistentes es: $inexistentes"