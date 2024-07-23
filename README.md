# NixOS Config

## Purpose

This repository contains my configurations for NixOS and Home Manager. The goal of the project is to build a modular system that can adapt to servers, desktops, and laptops.

## Configuration

Set the parameters of `userSettings` and `systemSettings` in the flake.nix file to configure the system.

<details><summary>Extra Config</summary>

- See [Desktop Environments](https://github.com/matteocavestri/nixos-config/blob/main/docs/desktop.md)
- See [Themes](https://github.com/matteocavestri/nixos-config/blob/main/docs/themes.md)
- See [Profiles](https://github.com/matteocavestri/nixos-config/blob/main/docs/profiles.md)

</details>

<table>
  <tr>
    <td>

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
<td>

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
