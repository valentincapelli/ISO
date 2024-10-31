#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Ingrese el nombre del usuario."
    exit 1
fi

if [ $(cat /etc/passwd | grep -c "$1") -eq 0 ]; then
    echo "Ese usuario no esta en el sistema."
    exit 1
fi

cant=0

while [ $cant -lt 30 ]; do
    if [ $(who | grep -c "$1") -gt 0 ]; then
        ((cant++))
        linea="$1 $(who | grep "$1" | awk '{print $3}')"
        echo "$linea" >> "/tmp/access$1.log"
        echo "El usuario se encuentra logeado."
    fi
    sleep 2
done