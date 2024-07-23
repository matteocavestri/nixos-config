# NixOS Config

## Purpose

This repository contains my configurations for NixOS and Home Manager. The goal of the project is to build a modular system that can adapt to servers, desktops, and laptops.

## Getting Started

To start using this configuration, it is necessary to create a hardware configuration in the `hardware` directory. The configuration imports the `hardware-configuration.nix` and all the necessary modules for that specific hardware (located in the `./hardware` directory). Once the hardware is configured for the machine, other settings can be set from the `flake.nix` file as follows.

## Configuration

Set the parameters of `userSettings` and `systemSettings` in the flake.nix file to configure the system.

<details><summary>Extra Config</summary>

- See [Desktop Environments](https://github.com/matteocavestri/nixos-config/blob/main/docs/desktop.md)
- See [Themes](https://github.com/matteocavestri/nixos-config/blob/main/docs/themes.md)
- See [Profiles](https://github.com/matteocavestri/nixos-config/blob/main/docs/profiles.md)

</details>

<table>
  <tr>
    <td valign="top">

### System Settings

| Setting  | Value             |
| -------- | ----------------- |
| system   | e.g. x86_64-linux |
| hostname | e.g. nixos-t2     |
| timezone | e.g. Europe/Rome  |
| locale   | e.g. it_IT.UTF-8  |
| keymap   | e.g. it           |
| profile  | see ./profiles    |
| hardware | WIP               |
| nixhw    | WIP               |

</td>
<td valign="top">

### User Settings

| Setting     | Value                          |
| ----------- | ------------------------------ |
| username    | Your username                  |
| name        | Your name (for git)            |
| email       | Your emain (for git)           |
| wm          | e.g. hyprland                  |
| theme       | see ./themes                   |
| font        | e.g. Inconsolata Nerd Font     |
| fontPkg     | e.g. pkgs.inconsolata-nerdfont |
| cursor      | e.g. Numix-Cursor              |
| cursorPkg   | e.g. pkgs.numix-cursor-theme   |
| icons       | e.g. Papirus                   |
| iconsPkg    | e.g. pkgs.papirus-icon-theme   |
| term        | WIP                            |
| browser     | WIP                            |
| editor      | e.g. nvim                      |
| dotfilesDir | e.g, .dotfiles (useful for nh) |

</td>

  </tr>
</table>

## Editor

I have implemented my text editor based on Nixvim, which is available [here](https://github.com/matteocavestri/nevica)

## Known Issues

- Freecad tries to use `cursor.pcf` --> see [Freecad Issue](https://github.com/FreeCAD/FreeCAD/issues/10514)
  - Solution: Change font --> `FreeCAD -> Edit -> Preferences -> Python -> Editor -> Display Items -> Text -> Family -> [SOME OTHER FONT]`
- Missing glaxnimate module for kdenlive
- Fix `nixhw` prop to be either string or null
