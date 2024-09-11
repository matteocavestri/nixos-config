{
  imports = [
    ../../../homeManagerModules/packages/default.nix

    ../../../user/config/hmconfig.nix
    ../../../user/shell/sh.nix # Shell config
    ../../../user/packages/terminal/nh.nix # nh (nixos/homemanager) config
  ];
}
