#!/bin/bash

array=()

# Cargamos el arreglo
for line in $(find /home -name "*.doc"); do
    array+=("$line")
done

function verArchivo() {
    if [ $# -ne 1 ]; then
        echo "Ingrese el nombre del archivo."
        return 1
    fi
    
    for elem in "${array[@]}"; do
        if [ "$1" == "$elem" ]; then
            cat $1
            return 0
        fi
    done
    
    echo "Archivo no encontrado."
    return 5
}

function cantidadArchivos {
    echo $(find /home -name "*.doc" | wc -l)
}

function borrarArchivo {
    if [ $# -ne 1 ]; then
        echo "Ingrese el nombre del archivo."
        return 1
    fi
    
    pos=-1
    
    for ((i=0; i<${#array[@]}; i++)); do
        if [ "${array[i]}" == "$1" ]; then
            pos=$i
            break
        fi
    done
    
    if [ $pos -eq -1 ]; then
        echo "Archivo no encontrado."
        return 10
    fi
    
    read -p "Quiere borrar el archivo logicamente? si / no " res
    
    unset array[pos]
    echo "$1 borrado del arreglo."
    
    if [ $res = "no" ]; then
        rm "$1"
        echo "$1 borrado del FileSystem."
    fi
    
}






verArchivo /home/a.doc

cantidadArchivos

borrarArchivo /home/b.doc