#!/bin/bash
# thunar-goto-root – vai para / na janela actual (testado em Thunar 4.20.6)

# 1. Encontra a janela activa do Thunar e garante foco
WID=$(xdotool getactivewindow)

# Se a janela activa não for do Thunar, procura a primeira janela do Thunar
if ! xdotool getwindowname "$WID" 2>/dev/null | grep -q "Thunar"; then
    WID=$(xdotool search --onlyvisible --class "Thunar" | head -1)
    [ -n "$WID" ] && xdotool windowfocus "$WID"
fi

# 2. Abre a barra de localização e vai para raiz
xdotool key --clearmodifiers ctrl+l   # Ctrl+L
sleep 0.08                            # um pouco mais de pausa para Thunar 4.20
xdotool type --delay 1 "/"            # escreve /
xdotool key Return                    # Enter
