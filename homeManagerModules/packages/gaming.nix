{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    user.packages = {
      minecraft.enable = lib.mkEnableOption "Enable Minecraft (Prism Launcher)";
      gamemode.enable = lib.mkEnableOption "Enable gamemode";
      mangohud.enable = lib.mkEnableOption "Enable mangohud";
      lutris.enable = lib.mkEnableOption "Enable lutris";
      heroic.enable = lib.mkEnableOption "Enable heroic";
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    # Install prismlauncher for minecraft
    home.packages = with pkgs;
      lib.optionals config.user.packages.minecraft.enable [
        prismlauncher
      ]
      # Enable Feral Gamemode
      ++ (lib.optionals config.user.packages.gamemode.enable [
        gamemode
      ])
      # Install Lutris
      ++ (lib.optionals config.user.packages.lutris.enable [
        lutris
      ])
      # Install Heroic Game Launcher
      ++ (lib.optionals config.user.packages.heroic.enable [
        heroic
      ]);

    # Enable MangoHud
    programs.mangohud.enable = lib.mkIf config.user.packages.mangohud.enable true;
  };
}
