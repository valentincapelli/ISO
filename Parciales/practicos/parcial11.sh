#!/bin/bash

array=()

for usuario in $(cat /etc/passwd | cut -d: -f1); do
    array+=("$usuario")
done

existe(){
    if [ $# -ne 1 ]; then
        echo "ERROR: tenes que ingresar un parametro"
        return 1
    fi

    for usuario in ${array[@]}; do
        if [ "$usuario" ==  "$1" ]; then 
            echo "El usuario existe"
            return 0
        fi
    done

    echo "El usuario no existe"
    return 1
}

eliminar_usuario(){
    if [ $# -ne 1 ]; then
        echo "ERROR: tenes que ingresar un parametro"
        return 2
    fi

    for ((i=0; i<${#array[@]}; i++)); do
        if [ ${array[$i]} == "$1" ]; then
            echo "El usuario ha sido eliminado"
            unset array[$i]
            array=("${array[@]}")
            return 0
        fi
    done

    echo "El usuario no se encontro"
    return 2
}

usuarios_con_patron(){
    if [ $# -ne 1 ]; then
        echo "ERROR: Tenes que ingresar un parametro"
        return 1
    fi

    for usuario in ${array[@]}; do
        if [ $(echo "$usuario" | grep "$1" | wc -l) -gt 0 ]; then
            echo "$usuario contiene la cadena de texto ingresada como parametro"
        fi
    done
}

cantidad(){
    echo ${#array[@]}
    return 0
}

usuarios(){
    echo "Todos sus elementos: ${array[*]}"
}

existe fabio
eliminar_usuario fabio
usuarios_con_patron io
cantidad
usuarios