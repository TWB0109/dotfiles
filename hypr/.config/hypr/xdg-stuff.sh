#!/usr/bin/env bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
systemctl --user stop pipewire 
systemctl --user stop wireplumber 
systemctl --user stop xdg-desktop-portal 
systemctl --user stop xdg-desktop-portal-hyprland
systemctl --user start pipewire 
systemctl --user start wireplumber 
systemctl --user start xdg-desktop-portal 
systemctl --user start xdg-desktop-portal-hyprland
