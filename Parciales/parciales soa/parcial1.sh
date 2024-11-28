#!/bin/bash

cant=0
proceso="apache"
while [ "$cant" -lt 10 ]; do
    if [ $(ps aux | grep apache | wc -l) -gt 0 ]; then
        ((cant++))
        echo "Proceso encontrado en ejecucion. Cant: $cant"
    fi
    sleep 5
done

echo "Se ha encontrado al proceso apache corriendo 10 veces."
exit 50