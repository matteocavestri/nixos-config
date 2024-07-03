# Profiles

Every profile depends on `./user/config.nix` and `./system/config.nix`.

### System default config

- `hardware-configuration.nix`
- `./apps/basepkgs.nix`
- `./hardware/locale.nix`
- `./hardware/systemd.nix`
- `./hardware/networking.nix`
- `./security/gpg.nix`
- `./security/users.nix`

### User default config (Home Manager)

- `./apps/editoe/neve.nix` WIP: editor must be choose from flake.nix
- `./apps/terminal/alacritty.nix`
- `./apps/terminal/kitty.nix` WIP: terminal must be choose from flake.nix
- `./apps/git/git.nix`
- `./apps/ranger/ranger.nix`
- `./shell/sh.nix`
- `./shell/cli-collection.nix`
- `./shell/tmux.nix`
