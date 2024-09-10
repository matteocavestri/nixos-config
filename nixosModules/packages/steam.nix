{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.packages.steam.enable = lib.mkEnableOption "Enable Steam";
  };

  config = lib.mkIf config.system.packages.steam.enable {
    environment.systemPackages = with pkgs; [
      steam
      steamPackages.steam-runtime
      steam-run
    ];
    programs = {
      gamemode.enable = true;
      steam = {
        enable = true;
        package = pkgs.steam.override {
          extraPkgs = pkgs:
            with pkgs; [
              xorg.libXcursor
              xorg.libXi
              xorg.libXinerama
              xorg.libXScrnSaver
              libpng
              libpulseaudio
              libvorbis
              stdenv.cc.cc.lib
              libkrb5
              keyutils
            ];
        };
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
    };
  };
}
