#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##

# For Hyprlock — direct lock, no loginctl (avoids kscreenlocker conflict)
pidof hyprlock || hyprlock -q &

# Ensure weather cache is up-to-date before locking (Waybar/lockscreen readers)
bash "$HOME/.config/hypr/UserScripts/WeatherWrap.sh" >/dev/null 2>&1

# Only fall back to loginctl if hyprlock failed
sleep 0.5
pidof hyprlock || loginctl lock-session

