#!/bin/bash
function esta_logueado {
    if [ $(who | grep "$1" | wc -l) -gt 0 ]; then
        echo "true"
    else
        echo "false"
    fi
}

function cant_procesos {
    echo "$(ps -u "$1" | wc -l)"
}

function uso_de_procesos {
    if [ $(cant_procesos "$1") -gt 100 ]; then
        echo "true"
    else
        echo "false"
    fi
}

if [ $# -lt 1 ]; then
    echo "Ingrese nombres de usuario."
    exit 1
fi

log_file="/var/log/usuarios_procesos.log"

for usuario in "$@"; do
    if [ $(esta_logueado "${usuario}") == "true" ]; then
        echo "El usuario ${usuario} esta logueado."
        echo "El usuario ${usuario} esta ejecutando $(cant_procesos "${usuario}") procesos."
        echo "El usuario ${usuario} esta ejecutando mas de 100 procesos? $(uso_de_procesos "${usuario}")"
        echo "$usuario $(date +"%Y-%m-%d %H:%M:%S")" >> "$log_file"
    fi
done




