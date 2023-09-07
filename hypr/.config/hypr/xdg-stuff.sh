#!/usr/bin/env bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
systemctl --user stop pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-hyprland
systemctl --user start wireplumber pipewire xdg-desktop-portal xdg-desktop-portal-hyprland
