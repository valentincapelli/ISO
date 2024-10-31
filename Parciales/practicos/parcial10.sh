#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Ingrese rutas."
    exit 1
fi

inexistentes=0

for elem in "$@"; do
    
    if [ -e "$elem" ]; then
        gzip "$elem"
    
    elif [ -d "$elem" ]; then
        if [ -r "$elem" ]; then
            tar -cvzf "$elem"
        fi
        if [ -w "$elem" ]; then
            rm -r "$elem"
        fi
    else
        ((inexistentes++))
    fi
    
done

echo "Inexistentes: $inexistentes"