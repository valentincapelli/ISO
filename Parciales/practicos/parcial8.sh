#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Ingrese el patron."
    exit 1
fi

SERVICE="local_service"

cant=0

for line in "/var/log"/*; do
    if [ -f "$line" ] && [ $(echo "$line" | grep -c $1) -gt 0 ]; then
        ((cant++))
    fi
done

echo "La cantidad de archivos con el patron $1 es: $cant"


echo "La cantidad de archivos con el patron $1 es: $(ls /var/log | grep -c "$1")"

# Consultar

exit 0