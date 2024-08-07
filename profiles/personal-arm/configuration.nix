{
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  # Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    # Default import
    (./. + "../../../hardware" + ("/" + systemSettings.hardware) + "/config.nix") # Hardware Import
    ../../system/security/gpg.nix # GPG config
    ../../system/config/fonts.nix # Fonts Config
    ../../system/config/systemd.nix # Systemd config
    ../../system/config/users.nix # Users config
    # Apps imports
    ../../system/pkgs/base.nix
    ../../system/pkgs/container.nix
    ../../system/pkgs/flatpak.nix
    # ../../system/pkgs/virtualization.nix
    # ../../system/pkgs/gaming.nix
    # Window manager imports
    (./. + "../../../system/wm" + ("/" + userSettings.wm) + ".nix")
  ];
}
