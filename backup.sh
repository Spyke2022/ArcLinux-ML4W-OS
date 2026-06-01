#!/usr/bin/env bash
# -----------------------------------------------------
# Backup das configs do ML4W OS -> repositório GitHub
# Uso:  backup.sh ["mensagem do commit"]
# -----------------------------------------------------
set -e

REPO="$HOME/ArcLinux-ML4W-OS"
CFG="$HOME/.config"

if [ ! -d "$REPO/.git" ]; then
    echo ":: Clonando repositório..."
    git clone https://github.com/Spyke2022/ArcLinux-ML4W-OS "$REPO"
fi

echo ":: Copiando configs..."

# fastfetch
mkdir -p "$REPO/fastfetch"
cp -f "$CFG/fastfetch/config.jsonc" "$REPO/fastfetch/" 2>/dev/null || true
cp -f "$CFG/fastfetch/info.sh"      "$REPO/fastfetch/" 2>/dev/null || true

# waybar (tema + módulos)
mkdir -p "$REPO/waybar"
cp -rf "$CFG/waybar/themes"       "$REPO/waybar/" 2>/dev/null || true
cp -f  "$CFG/waybar/modules.json" "$REPO/waybar/" 2>/dev/null || true
cp -f  "$CFG/waybar/launch.sh"    "$REPO/waybar/" 2>/dev/null || true

# hyprland (configs + scripts: powermenu.sh, menu.sh, etc)
mkdir -p "$REPO/hypr"
cp -rf "$CFG/hypr/conf"          "$REPO/hypr/" 2>/dev/null || true
cp -rf "$CFG/hypr/scripts"       "$REPO/hypr/" 2>/dev/null || true
cp -f  "$CFG/hypr/hyprland.conf" "$REPO/hypr/" 2>/dev/null || true

# settings do ML4W
mkdir -p "$REPO/ml4w-settings"
cp -f "$CFG/ml4w/settings/"*.sh "$REPO/ml4w-settings/" 2>/dev/null || true

# prompt (oh-my-posh)
mkdir -p "$REPO/ohmyposh"
cp -f "$CFG/ohmyposh/"*.toml "$REPO/ohmyposh/" 2>/dev/null || true
cp -f "$CFG/ohmyposh/"*.json "$REPO/ohmyposh/" 2>/dev/null || true

# customizacao do bash do ML4W
mkdir -p "$REPO/bashrc"
cp -f "$CFG/bashrc/"* "$REPO/bashrc/" 2>/dev/null || true

# Commit + push
cd "$REPO"
git add -A

if git diff --cached --quiet; then
    echo ":: Nada mudou. Backup já está atualizado."
    exit 0
fi

MSG="${1:-backup configs $(date '+%Y-%m-%d %H:%M')}"
git commit -m "$MSG"
git push
echo ":: Backup concluído e enviado ao GitHub."
