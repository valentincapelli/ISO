#!/bin/bash

array=()

function insert {
    if [ $# -ne 1 ]; then
        echo "Ingrese un (1) parametro."
        return 1
    fi
    
    array+=("$1")
    return 0
}

function rellenar_n {
    if [ $# -ne 1 ]; then
        echo "Ingrese un (1) parametro."
        return 1
    fi
    
    for ((i = 0; i<$1; i++)); do
        echo "Ingrese un texto: "
        read texto
        array+=($texto)
    done
    return 0
}


function select_elemento {
    if [ $# -ne 1 ]; then
        echo "Ingrese un (1) parametro."
        return 1
    fi
    
    if [ "$1" == "*" ]; then
        echo "${array[*]}"
        return 0
    else
        for i in "${!array[@]}" do
            if [ "$1" == "${array[i]}" ]; then
                echo "Se encontro el elemento $1 en la posicion $i "
                return 0
            fi
        done
        echo "Elemento no encontrado"
    fi
    return 0
}


function delete_elemento {
    if [ $# -ne 1 ]; then
        echo "Ingrese un (1) parametro."
        return 1
    fi
    
    if [ "$1" == "*" ]; then
        array=()
        return 0
    else
        for i in "${!array[@]}" do
            if [ "$1" == "${array[i]}" ]; then
                unset array[i]
                echo "Se elimino el elemento $1 en la posicion $i "
                return 0
            fi
        done
        echo "Elemento no encontrado"
    fi
    return 0
}
