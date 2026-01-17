#!/bin/bash

for file in "$@"; do
    if [ -f "$file" ]; then
        base_name="${file%.pdf}"
        gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
           -sOutputFile="${base_name}_pagina_%d.pdf" "$file"
        notify-send "PDF Dividido" "Ficheiro ${file} dividido com sucesso."
    else
        notify-send "Erro" "Ficheiro ${file} não encontrado."
    fi
done

