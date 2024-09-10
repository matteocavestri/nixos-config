{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.virtualisation.wine = {
      enable = lib.mkEnableOption "Enable Wine support";
      support32 = lib.mkEnableOption "Support 32-bit Wine";
    };
  };
  config = lib.mkIf config.system.virtualisation.wine.enable {
    # Install wine64 default packages
    environment.systemPackages = with pkgs;
      [
        wine64
        winetricks
      ]
      # Install wine32 if needed
      ++ (lib.optionals config.system.virtualisation.wine.support32 [
        wine
      ])
      # Install native wayland support if needed
      ++ (lib.optionals config.system.services.wayland.enable [
        wineWowPackages.waylandFull
      ]);
  };
}
