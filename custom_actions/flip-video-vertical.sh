#!/bin/bash

# Loop por todos os arquivos selecionados
for input_file in "$@"; do
    # Extrai o nome sem extensão e a extensão do arquivo
    base_name="${input_file%.*}"
    extension="${input_file##*.}"

    # Define o nome do arquivo de saída
    output_file="${base_name}-FLIPPED.${extension}"

    # Executa o comando ffmpeg com vflip
    ffmpeg -i "$input_file" -vf "vflip" -c:a copy "$output_file"

    # Verifica se a conversão foi bem-sucedida
    if [ $? -eq 0 ]; then
        notify-send "Thunar Action" "Vídeo invertido com sucesso: $output_file" -i video-x-generic
    else
        notify-send "Thunar Action" "Erro ao inverter o vídeo: $input_file" -i dialog-error
    fi
done
