#!/bin/bash

array=()

for elem in $(find "$HOME" -name "*.sh"); do
    if [ -f "$elem" ]; then #probar con otra forma, usando &&
        array+=("$elem")
    fi
done

function cantidad() {
    echo "La cantidad de archivos con terminacion .conf: ${#array[@]}"
}

function ver() {
    echo "Los nombres de todos los archivos con terminacion .conf:"
    for elem in "${array[@]}"; do
        echo "$elem"
    done
}

function existe() {
    if [ $# -ne 1 ]; then
        echo "La cantidad de parametros es incorrecta."
        exit 1
    fi    
    
    for elem in "${array[@]}"; do
        if [ "$elem" == "$1" ]; then
            echo "$1 esta en el /etc."
            exit 0
        fi
    done
    echo "$1 no esta en el /etc."
}

function eliminar() {
    if [ $# -ne 2 ]; then
        echo "La cantidad de parametros es incorrecta."
        exit 1
    fi
    for i in "${!array[@]}"; do
        if [ "${array[i]}" == "$1" ]; then
            unset array[i]
            echo "Se borro $1 del arreglo."
            if [ "$2" == "fisico" ]; then
                rm "$1"
                echo "Se borro $1 del File System."
            fi
            exit 0
        fi
    done
    echo "No se encontro el archivo."
    exit 1
}

ver





