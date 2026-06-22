# 🍎 Arch-Hyprland Rice — Backup

> **Forked from [JaKooLit/Arch-Hyprland](https://github.com/JaKooLit/Arch-Hyprland)**
>
> JaKooLit Dots v2.3.20 — Hyprland 0.55.4

This is a personal backup of my Hyprland desktop configuration ("rice").  
Based on **JaKooLit's Hyprland Dots v2.3.x** with customizations:
- macOS-style floating glass dock (Waybar at bottom, edge-to-edge)
- Minimal compact workspace indicators
- Custom weather scripts (Open-Meteo, no API key needed)
- Wallust theming (auto-generated colors from wallpaper)
- Memory usage in the dock

---

## 🖥️ System Info

| Component | Version |
|-----------|---------|
| Laptop | Lenovo ThinkBook 16p Gen 3 (21EK) |
| OS | Arch Linux |
| Kernel | 7.0.12-arch1-1 |
| Hyprland | 0.55.4 |
| Waybar | 0.15.0 |
| Swaync | 0.12.6 |
| Rofi | 2.0.0 |
| Kitty | 0.47.1 |
| Wallust | 3.5.2 |
| Btop | 1.4.7 |
| Cava | 0.10.7 |
| GPU | NVIDIA RTX 3060 + AMD Radeon 680M |
| Display | eDP-2 2560x1600@165Hz |

## 🚀 Quick Install

### 1. Install Packages

**Official repos:**
```bash
sudo pacman -S --needed \
  hyprland waybar swaync rofi kitty thunar \
  thunar-archive-plugin thunar-volman btop cava wallust wofi \
  nwg-look nwg-displays hyprlock hypridle hyprsunset hyprshot \
  hyprpolkitagent networkmanager network-manager-applet blueman \
  pipewire pipewire-pulse pipewire-alsa pipewire-audio wireplumber \
  power-profiles-daemon xdg-desktop-portal-hyprland \
  qt5-wayland qt6-wayland pavucontrol playerctl pamixer \
  brightnessctl polkit-kde-agent swww imagemagick \
  python-requests python-pillow \
  ttf-jetbrains-mono-nerd
```

**AUR packages:**
```bash
# Using yay or paru
yay -S wallust  # if not in official repos
```

### 2. Clone & Apply Configs

```bash
git clone https://github.com/jfang2048/Arch-Hyprland.git
cd Arch-Hyprland
git checkout backup
```

Then copy configs to ~/.config:

```bash
cp -r config/* ~/.config/
```

Or use the included setup script:

```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

### 3. Set Up GTK Theme & Cursor

- **GTK Theme:** Flat-Remix-GTK-Blue-Dark
- **Cursor:** Bibata-Modern-Ice
- **Wallpaper:** Included in `wallpapers/` — set with:
  ```bash
  swww img wallpapers/your-wallpaper.jpg
  ```
  Or use the current wallpaper (if included):
  ```bash
  cp wallpapers/current_wallpaper ~/.config/hypr/wallpaper_effects/.wallpaper_current
  ```

### 4. Reboot & Enjoy

After applying configs, reboot or restart Hyprland:

```bash
hyprctl dispatch exit
# then login again via SDDM
```

---

## 📁 Structure

```
config/
├── hypr/           # Hyprland configs, scripts, UserConfigs
│   ├── UserConfigs/    # Your custom overrides (startup apps, env vars, keybinds)
│   ├── UserScripts/    # Custom scripts (weather, wallpapers, effects)
│   └── scripts/        # Hyprland system scripts (JaKooLit defaults)
├── waybar/         # Waybar bar configs & styles
│   ├── configs/        # Layout config files
│   ├── style/          # CSS style files (incl. [macOS] Dock.css)
│   └── wallust/        # Wallust-generated colors for waybar
├── swaync/         # Notification center
├── rofi/           # App launcher
├── kitty/          # Terminal
├── wallust/        # Theme auto-color generator
├── cava/           # Audio visualizer
├── btop/           # System monitor
└── gtk-3.0/        # GTK theme settings
scripts/
├── setup.sh        # One-command setup script
├── install-pkgs.sh # Package installation script
wallpapers/         # Wallpaper collection (+ current_wallpaper)
```

## 🎨 Customization Highlights

- **Bottom macOS Dock** — Edge-to-edge dark glass bar with tight compact spacing
  - Active config: `config/waybar/configs/[BOT] Default Laptop`
  - Active style: `config/waybar/style/[macOS] Dock.css`
  - Minimal rounded corners (4px dock, 2px modules), small font (11px), snug padding
- **Memory Usage** — `"memory"` module in modules-right, shows `2.4G 󰾆` format
- **Theme** — Flat-Remix-GTK-Blue-Dark
- **Cursor** — Bibata-Modern-Ice
- **Weather** — Uses Open-Meteo (free, no API key) via Python
  - Location auto-detected by IP, or set manually in `UserScripts/Weather.py`
- **Wallust** — Auto-generates color scheme from wallpaper
- **Notifications** — Swaync at bottom, styled to match the dock
- **Audio** — PipeWire + WirePlumber + pavucontrol
- **Startup** — Waybar launched via user config `UserConfigs/Startup_Apps.conf` (override), no `&` or `sleep` needed

## ⚙️ Startup Details

Waybar is launched cleanly from the **user config override**:

`~/.config/hypr/UserConfigs/Startup_Apps.conf`:
```
exec-once = waybar
```

The default startup config's `sleep 1 && waybar &` is commented out to prevent double-launch race conditions that caused crashes.

## 🔗 Links

- Original: [JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)
- Hyprland Wiki: [wiki.hyprland.org](https://wiki.hyprland.org/)
