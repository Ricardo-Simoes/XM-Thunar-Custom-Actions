#!/bin/bash

for file in "$@"; do
    if [ -f "$file" ]; then
        base_name="${file%.pdf}"

        # Cria um PDF com as duas primeiras páginas (1 e 2)
        gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
           -dFirstPage=1 -dLastPage=2 \
           -sOutputFile="${base_name}_original_duplicado.pdf" "$file"

        # Cria um PDF apenas com a terceira página
        gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
           -dFirstPage=3 -dLastPage=3 \
           -sOutputFile="${base_name}_triplicado.pdf" "$file"

        notify-send "PDF Dividido" "Ficheiro ${file} dividido com sucesso."
    else
        notify-send "Erro" "Ficheiro ${file} não encontrado."
    fi
done

