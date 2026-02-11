#!/usr/bin/env sh

# caminhos
THEME_FILE="$HOME/.config/waybar/theme.conf"
THEMES_DIR="$HOME/.config/waybar/themes"

# Terminate already running bar instances
killall waybar

# Wait until the processes have been shut down
while pgrep -x waybar >/dev/null; do sleep 1; done


# 3. Ler o tema atual (se não existir, usa o 'default')
if [ -f "$THEME_FILE" ]; then
    CURRENT_THEME=$(cat "$THEME_FILE")
else
    CURRENT_THEME="default"
fi

# Verificar se a pasta do tema realmente existe, senão volta pro default
if [ ! -d "$THEMES_DIR/$CURRENT_THEME" ]; then
    CURRENT_THEME="default"
fi

# 4. Iniciar o Waybar apontando para o config e style específicos
# O '&' no final é crucial para não travar o terminal/script
waybar -c "$THEMES_DIR/$CURRENT_THEME/config-niri.json" -s "$THEMES_DIR/$CURRENT_THEME/style.css" &


# Launch main
# waybar -c ~/.config/waybar/config-niri.json &
