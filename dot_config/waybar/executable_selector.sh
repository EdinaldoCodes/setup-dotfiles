#!/bin/bash

# Caminhos
THEMES_DIR="$HOME/.config/waybar/themes"
THEME_FILE="$HOME/.config/waybar/theme.conf"
LAUNCHER="$HOME/.config/waybar/waybar.sh"

# 1. Listar os nomes das pastas dentro de 'themes'
# 'ls' lista os arquivos, e passamos para o rofi (ou wofi/fuzzel)
CHOICE=$(ls "$THEMES_DIR" | rofi -dmenu -p "Waybar Theme:")

# 2. Se o usuário escolheu algo (não apertou ESC)
if [ -n "$CHOICE" ]; then
    # Salva a escolha no arquivo de texto
    echo "$CHOICE" > "$THEME_FILE"
    
    # Reinicia a waybar com o novo tema
    "$LAUNCHER"
    
    # Opcional: Notificação para confirmar
    notify-send "Waybar" "Tema alterado para: $CHOICE"
fi