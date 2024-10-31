#!/bin/bash

if [ $# -ne 1 ]; then
    echo "No ingreso la ruta del directorio."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "$1 no existe."
    exit 4
fi

archivos_lectura=0
archivos_escritura=0

for elem in "$1"/* ; do
    if [ -f "$elem" ]; then
        if [ -r "$elem" ]; then
            ((archivos_lectura++))
        fi
        if [ -w "$elem" ]; then
            ((archivos_escritura++))
        fi
    fi
done

echo "Cantidad de archivos con permisos de lectura $archivos_lectura"
echo "Cantidad de archivos con permisos de escritura $archivos_escritura"