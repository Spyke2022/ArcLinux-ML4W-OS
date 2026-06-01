#!/usr/bin/env bash
opcao=$(printf "Logoff\nReiniciar\nDesligar" | rofi -dmenu -i \
    -theme ~/.config/rofi/config-short.rasi \
    -p "Energia")

case "$opcao" in
    Logoff)    hyprctl dispatch exit ;;
    Reiniciar) systemctl reboot ;;
    Desligar)  systemctl poweroff ;;
esac
