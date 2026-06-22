#!/usr/bin/env bash
# Setup script for Arch-Hyprland Rice Backup
# Run from the repo root: ./scripts/setup.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "🔧 Setting up Arch-Hyprland Rice..."
echo "Repo at: $SCRIPT_DIR"

# 1. Create config directories
mkdir -p ~/.config

# 2. Copy configs (don't overwrite existing unless forced)
echo "📁 Copying configs..."
cp -r --update "$SCRIPT_DIR/config/"* ~/.config/

# 3. Set up wallpaper
echo "🖼️ Setting up wallpaper..."
mkdir -p ~/Pictures/wallpapers
cp -r --update "$SCRIPT_DIR/wallpapers/"* ~/Pictures/wallpapers/ 2>/dev/null || true

# 4. Check for required commands
echo "🔍 Checking dependencies..."
MISSING=0
for cmd in hyprctl waybar swaync rofi kitty wallust swww playerctl; do
    if ! command -v "$cmd" &>/dev/null; then
        echo "  ⚠️  $cmd not found in PATH"
        MISSING=1
    fi
done

if [ "$MISSING" -eq 1 ]; then
    echo ""
    echo "⚠️  Some dependencies are missing. Run:"
    echo "  ./scripts/install-pkgs.sh"
    echo "  Or manually: sudo pacman -S --needed <packages>"
fi

# 5. Initial-boot flag
if [ ! -f ~/.config/hypr/.initial_startup_done ]; then
    echo "🚀 Running initial boot script..."
    bash ~/.config/hypr/initial-boot.sh 2>/dev/null || true
fi

echo ""
echo "✅ Setup complete!"
echo "🔄 Restart Hyprland or run 'hyprctl reload'"
