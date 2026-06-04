#!/usr/bin/env bash
g=$'\033[32m'   # verde (bordas)
r=$'\033[31m'   # vermelho (chaves)
x=$'\033[0m'    # reset

USERNAME=$(whoami)
HNAME=$(cat /etc/hostname 2>/dev/null || hostname)
OS="Arch Linux x86_64"
KERN=$(uname -r)
WM="Hyprland 0.55.2"
SHELLV="bash ${BASH_VERSION%%(*}"

KW=5
VW=21
dash() { printf '─%.0s' $(seq 1 "$1"); }

TL="${g}╭$(dash $((KW+2)))┬$(dash $((VW+2)))╮${x}"
ML="${g}├$(dash $((KW+2)))┼$(dash $((VW+2)))┤${x}"
BL="${g}╰$(dash $((KW+2)))┴$(dash $((VW+2)))╯${x}"

row() {
    printf "${g}│${x} ${r}%-${KW}s${x} ${g}│${x} %-${VW}s ${g}│${x}\n" "$1" "$2"
}

circles=""
for c in 1 2 3 4 5 6 7; do circles+=$'\033['"3${c}m●${x} "; done
pad=$(printf '%*s' 8 '')

echo "$TL"
row "user"  "$USERNAME"
row "hname" "$HNAME"
row "os"    "$OS"
row "kern"  "$KERN"
row "wm"    "$WM"
row "shell" "$SHELLV"
echo "$ML"
printf "${g}│${x} ${r}%-${KW}s${x} ${g}│${x} %b%s${g}│${x}\n" "color" "$circles" "$pad"
echo "$BL"
