# Themes

## Desktop Theme

The theme can be modified by changing the value of the `theme` string in `flake.nix`. The built-in themes are available in the `./themes` directory and are base 16. Currently, theme support is `Work in Progress` and only Window Managers (only Hyprland for now) are supported.

## Fonts

To customize the fonts, you need to modify the `font` and `fontPkg` strings in `flake.nix`. The tested fonts are:

| Name                  | Package                  |
| --------------------- | ------------------------ |
| Inconsolata Nerd Font | pkgs.inconsolata-nerfont |
| FiraCode Nerd Font    | pkgs.fira-code-nerfont   |

## Icons

To customize the icons, you need to modify the `icons` and `iconsPkg` strings in `flake.nix`. The tested icons are:

| Name    | Package                       |
| ------- | ----------------------------- |
| Papirus | pkgs.papirus-icon-theme       |
| Adwaita | pkgs.gnome.adwaita-icon-theme |

## Cursors

To customize the cursors, you need to modify the `cursor` and `cursorPkg` strings in `flake.nix`. The tested cursors are:

| Name                          | Package                           |
| ----------------------------- | --------------------------------- |
| Numix-Cursor                  | pkgs.numix-cursor-theme           |
| catppuccin-mocha-dark-cursors | pkgs.catppuccin-cursors.mochaDark |
