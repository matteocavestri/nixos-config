---
title: appearance
description: NixOS config appearance documentation
author: matteocavestri
categories: created: 2024-09-04T17:52:33+0100
updated: 2024-09-04T18:14:23+0100
version: 1.1.1
---

# Appearance (userSettings.appearance)

The **Appearance** section contains the system's appearance settings. These configurations affect both the user side and the system side, but only if a graphical interface is configured.  
The _system-targets_ are:  
 - LightDM  
 - Gnome  
 - NixOS Icons  
 - Console  
The _home-targets_ are:  
 - KDE  
 - Gnome  
 - XFCE  
 - GTK  
 - Kitty  
 - Mangohud  
 - Lazygit  
 - Fzf  
 - Firefox  
 - Bat  
 - Btop  
 - Hyprpaper  
On the user side, there are also specific configurations for **Gtk** and **QT**.  
 The _GTK_ customizations are always used when a GUI is in use. They are used to configure the cursor theme, icon theme, and to enable the adwaita-gtk3 theme for gtk3 programs. In addition, it selects _prefer-dark_ as the color scheme (this helps to have a dark theme for Flatpak applications).  
 The _QT_ customizations are only used if _KDE_ is not used as the Desktop Environment. This configuration is used to modify the appearance of QT programs in a GTK environment using the adwaita-qt theme, qt5ct, and qt6ct.

## Theme (userSettings.appearance.theme)

This setting changes the color theme (base16) of the system, all programs, and changes the wallpaper (Currently, the configuration applies to **Hyprland**, **KDE**, **Gnome**, **Budgie** regarding wallpapers). All _GTK_ and _QT_ programs are affected by this configuration, and the _home-targets_ are affected in an even more specific manner. System configurations are available to target the Console and display managers like Gdm and LightDM.  
SDDM has a separate configuration and is set to follow both the system theme and the wallpaper using the _sddm-chili-theme_.  
LightDM, on the other hand, is influenced by the theme's polarity and switches from _Adwaita_ to _adwaita-Dark_ depending on whether the selected theme is light or dark.  
All themes can be found in the **/themes** directory.

## Font (userSettings.appearance.font)

This setting changes the system font. It is recommended to use a **Nerd Font** since various parts of the system require it, such as the shell configuration and the text editor.  
The configuration consists of:  
 - **userSettings.appearance.font.name** which specifies the name of the font to use.  
 - **userSettings.appearance.font.package** which specifies the package to use.

## Cursor (userSettings.appearance.cursor)

This setting changes the system cursor and affects all WM/DE.  
The configuration consists of:

- **userSettings.appearance.cursor.name** which specifies the name of the cursor to use.
  - **userSettings.appearance.cursor.package** which specifies the package to use.

## Icons (userSettings.appearance.icons)

This setting changes the system icons and affects all WM/DE.  
The configuration consists of:  
 - **userSettings.appearance.icons.name** which specifies the name of the icons to use.  
 - **userSettings.appearance.icons.package** which specifies the package to use.

# Desktop Environment customization

## KDE

## Gnome

## Budgie

# Window Manager customization

## Hyprland

# Tested Packages

## Fonts

## Icons

## Cursors
