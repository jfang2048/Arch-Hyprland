#!/usr/bin/env bash
# Install required packages for Arch-Hyprland Rice
# Run with: sudo ./scripts/install-pkgs.sh

set -e

if [ "$EUID" -ne 0 ]; then
    echo "❌ Please run as root: sudo ./scripts/install-pkgs.sh"
    exit 1
fi

echo "📦 Installing official packages..."

pacman -S --needed \
    hyprland \
    waybar \
    swaync \
    rofi \
    kitty \
    thunar \
    thunar-archive-plugin \
    thunar-volman \
    btop \
    cava \
    wallust \
    wofi \
    nwg-look \
    nwg-displays \
    hyprlock \
    hypridle \
    hyprsunset \
    hyprshot \
    hyprpolkitagent \
    networkmanager \
    network-manager-applet \
    blueman \
    pipewire \
    pipewire-pulse \
    pipewire-alsa \
    pipewire-audio \
    wireplumber \
    power-profiles-daemon \
    xdg-desktop-portal-hyprland \
    qt5-wayland \
    qt6-wayland \
    pavucontrol \
    playerctl \
    pamixer \
    brightnessctl \
    polkit-kde-agent \
    swww \
    imagemagick \
    python-requests \
    python-pillow \
    ttf-jetbrains-mono-nerd

echo ""
echo "✅ Official packages installed."
echo ""
echo "📦 AUR packages (install with yay/paru):"
echo "  - wallust (if not in official repos)"
echo "  - Bibata-Modern-Ice cursor theme"
echo ""
echo "ℹ️  Enable services:"
echo "  sudo systemctl enable --now NetworkManager"
echo "  systemctl --user enable --now pipewire wireplumber"
