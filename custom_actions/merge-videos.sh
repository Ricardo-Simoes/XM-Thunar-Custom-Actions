#!/bin/bash

# Ficheiro de saída
output_file="merged-video-files.mp4"

# Verificar se há ficheiros selecionados
if [ "$#" -lt 2 ]; then
    echo "Por favor, selecione pelo menos dois ficheiros para unir."
    exit 1
fi

# Criar ficheiro temporário na ramdrive
tmp_list="/mnt/ramdrive/video-list.txt"
> "$tmp_list"  # Garante que o ficheiro está vazio

# Adicionar ficheiros ao ficheiro temporário
for file in "$@"; do
    echo "file '$file'" >> "$tmp_list"
done

# Executar o comando ffmpeg
ffmpeg -f concat -safe 0 -i "$tmp_list" -c copy "/mnt/ramdrive/$output_file"

# Limpar ficheiro temporário
rm "$tmp_list"

# Mensagem de sucesso
echo "Vídeos unidos com sucesso em: /mnt/ramdrive/$output_file"
notify-send "Thunar Custom Action" "Vídeos unidos com sucesso: /mnt/ramdrive/$output_file"

read -p "Pressione [Enter] para fechar o terminal..."

