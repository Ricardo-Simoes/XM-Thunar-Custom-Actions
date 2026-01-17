#!/bin/bash

# Recolhe o nome completo do ficheiro como parâmetro
input_file="$1"

# Extrai o nome sem extensão e a extensão do ficheiro
base_name="${input_file%.*}"
extension="${input_file##*.}"

# Define o nome do ficheiro de saída
output_file="${base_name}-VERTICAL.${extension}"

# Executa o comando ffmpeg
ffmpeg -i "$input_file" -vf transpose=2 -s 1080x1920 -c:a copy "$output_file"

# Verifica se a conversão foi bem-sucedida
if [ $? -eq 0 ]; then
    notify-send "Thunar Action" "Vídeo convertido com sucesso: $output_file" -i video-x-generic
else
    notify-send "Thunar Action" "Erro ao converter o vídeo!" -i dialog-error
fi

