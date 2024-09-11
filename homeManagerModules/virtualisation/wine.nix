{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.virtualisation.wine = {
      enable = lib.mkEnableOption "Enable wine, and proton";
      bottles = lib.mkEnableOption "Install bottles";
      protonDir = lib.mkEnableOption "Proton directory";
    };
  };
  config = {
    # Install proton support and protontricks helper
    home.packages = with pkgs;
      lib.optionals config.user.virtualisation.wine.enable [
        protonup
        protontricks
        dxvk
        vkd3d
      ]
      # Install bottles
      ++ (lib.optionals config.user.virtualisation.wine.bottles [
        bottles
      ]);

    # Proton compatibility directory
    home.sessionVariables = lib.mkIf config.user.virtualisation.wine.protonDir {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
