{
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    (./. + "../../../system/wm" + ("/" + userSettings.wm) + ".nix")
    ../minimal/configuration.nix
    ../../system/hardware/pipewire.nix
    ../../system/style/stylix.nix
  ];
}
