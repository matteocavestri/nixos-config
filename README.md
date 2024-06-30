# My NixOS and Home Manager config

## Scopi

Questa repository contiene le mie configurazioni per NixOS e Home Manager. L'obiettivo del progetto è costruire un sistema modulare che possa adattarsi a server, desktop e laptop.

## Configurazione

Configurare i parametri di `userSettings` e `systemSettings`nel file flake.nix per configurare il sistema

### System Settings

| Setting  | Value e.g.     |
| -------- | -------------- |
| system   | x86_64-linux   |
| hostname | nixos-t2       |
| timezone | Europe/Rome    |
| locale   | it_IT.UTF-8    |
| keymap   | it             |
| profile  | see ./profiles |
| hardware | WIP            |

### User Settings

| Setting   | Value                          |
| --------- | ------------------------------ |
| username  | Your username                  |
| name      | Your name (for git)            |
| email     | Your emain (for git)           |
| wm        | e.g. hyprland                  |
| theme     | see ./themes                   |
| font      | e.g. Inconsolata Nerd Font     |
| fontPkg   | e.g. pkgs.inconsolata-nerdfont |
| cursor    | e.g. Numix-Cursor              |
| cursorPkg | e.g. pkgs.numix-cursor-theme   |
| term      | WIP                            |
| browser   | WIP                            |

## Struttura della repository

```plaintext
nixos-config
 |
 |--> flake.nix
 |--> flake.lock
 |----> system/
 |       |----> apps/
 |       |       |----> system-packages.nix
 |       |
 |       |----> driver/
 |       |       |----> driver-configs.nix
 |       |
 |       |----> hardware/
 |       |       |----> hardware-configs.nix
 |       |
 |       |----> security/
 |       |       |----> system-security.nix
 |       |
 |       |----> style/
 |       |       |----> system-style-config.nix
 |       |
 |       |----> vm/
 |       |       |----> window-manager-system-config.nix
 |       |
 |       |----> hardware-configuration.nix
 |
 |----> user/
 |       |----> apps/
 |       |       |----> appGroup1/
 |       |                |----> app.nix
 |       |
 |       |----> lang/
 |       |       |----> programmingLanguage/
 |       |                |----> programming-language-user-pkgs.nix
 |       |
 |       |----> shell/
 |       |       |----> user-shell-configs.nix
 |       |
 |       |----> style/
 |       |       |----> user-style-config.nix
 |       |
 |       |----> wm/
 |               |----> windowManager1/
 |                       |----> window-manager-user-config.nix
 |
 |----> themes/
 |       |----> theme1/
 |               |----> theme.yaml
 |               |----> background.txt
 |
 |----> profiles/
         |----> profile1/
                 |----> home.nix
                 |----> configuration.nix
```

## Todos

- Migrate my old dotfiles
- Can customize everything from flake.nix --> Cursor, Icons
- Make gropus of packages (work, code ...)
- Control power profile from waybar
