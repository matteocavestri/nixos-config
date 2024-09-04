---
title: profiles
description: NixOS config profiles documentation
author: matteocavestri
categories: created: 2024-09-04T18:36:11+0100
updated: 2024-09-04T18:37:41+0100
version: 1.1.1
---

# System Configuration

## Profiles

### Full

It contains all configurations

- Container support (Docker, Podman, Distrobox)
- Virtualization support (KVM, qemu)
- Android support (Waydroid)
- Windows support (Wine, Proton)
- Flatpak support
- AppImage support
- Gaming support
- Zram configuration
  It also contains all the Minimal-GUI configurations

### Minimal

It contains only the minimal configurations

- Font configuration
- Systemd configuration
- User configuration
- Optimizations
- Kernel configuration

### Minimal-Gui

It extends minimal with GUI support

- WM configuration
- Graphics server (X11, Wayland)
- Display manager (sddm, gdm, lightdm)
- WM/DE (hyprland, gnome, xfce, etc)
- Pipewire configuration
- Dconf configuration
- Stylix configuration

### Server

It uses minimal as its base and it adds:

- Container support (Docker, Podman, Distrobox)

### Hypervisor

It uses minimal as its base and it adds:

- Container support (Docker, Podman, Distrobox)
- Virtualization support (KVM, qemu)

### Personal

It uses minimal-gui as its base and it adds:

- Container support (Docker, Podman, Distrobox)
- Virtualization support (KVM, qemu)
- Android support (Waydroid)
- Windows support (Wine, Proton)
- Flatpak support
- AppImage support
- Gaming support
- Zram configuration

### Work

It uses minimal-gui as its base and it adds:

- Container support (Docker, Podman, Distrobox)
- Virtualization support (KVM, qemu)
- Android support (Waydroid)
- Windows support (Wine, Proton)
- Zram configuration

### Gaming
