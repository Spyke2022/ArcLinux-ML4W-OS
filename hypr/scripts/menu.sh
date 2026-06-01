#!/usr/bin/env bash
# Menus dmenu da waybar. Uso: menu.sh {internet|midia|escritorio|sistema}
THEME="$HOME/.config/rofi/config-short.rasi"
W='window {width: 460px;}'

case "$1" in
  internet)
    op=$(printf "Chrome\nThunderbird" \
      | rofi -dmenu -i -theme "$THEME" -theme-str "$W listview {lines: 2;}" -p "Internet")
    case "$op" in
      Chrome) google-chrome-stable & ;;
      Thunderbird) thunderbird & ;;
    esac ;;
  midia)
    op=$(printf "VLC\ngThumb\nGIMP" \
      | rofi -dmenu -i -theme "$THEME" -theme-str "$W listview {lines: 3;}" -p "Multimídia")
    case "$op" in
      VLC) vlc & ;;
      gThumb) gthumb & ;;
      GIMP) gimp & ;;
    esac ;;
  escritorio)
    op=$(printf "Writer\nCalc\nImpress\nEvince\nEditor de Texto" \
      | rofi -dmenu -i -theme "$THEME" -theme-str "$W listview {lines: 5;}" -p "Escritório")
    case "$op" in
      Writer) libreoffice --writer & ;;
      Calc) libreoffice --calc & ;;
      Impress) libreoffice --impress & ;;
      Evince) evince & ;;
      "Editor de Texto") gnome-text-editor & ;;
    esac ;;
  sistema)
    op=$(printf "Nemo\nNautilus\nHtop\nPulseAudio\nRede\nBluetooth\nCalculadora\nFlameshot\nTerminal" \
      | rofi -dmenu -i -theme "$THEME" -theme-str "$W listview {lines: 9;}" -p "Sistema")
    case "$op" in
      Nemo) nemo & ;;
      Nautilus) nautilus & ;;
      Htop) kitty -e htop & ;;
      PulseAudio) pavucontrol & ;;
      Rede) nm-connection-editor & ;;
      Bluetooth) blueman-manager & ;;
      Calculadora) gnome-calculator & ;;
      Flameshot) flameshot gui & ;;
      Terminal) kitty & ;;
    esac ;;
esac
