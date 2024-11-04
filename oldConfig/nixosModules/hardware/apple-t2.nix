{
  lib,
  config,
  pkgs,
  ...
}: let
  substituters = ["https://cache.soopy.moe"];
in {
  options = {
    system.hardware.apple.applet2 = {
      enable = lib.mkEnableOption "Enable Apple T2 WiFi Firmware";
      substituters = lib.mkEnableOption "Enable Apple T2 kernel Substituters";
    };
  };

  config = {
    # Apple T2 WiFi Firmware
    hardware.firmware = lib.mkIf config.system.hardware.apple.applet2.enable [
      (pkgs.stdenv.mkDerivation (final: {
        name = "brcm-firmware";
        src = /lib/firmware/brcm;
        installPhase = ''
          mkdir -p $out/lib/firmware/brcm
          cp ${final.src}/* "$out/lib/firmware/brcm"
        '';
      }))
    ];

    # Apple T2 kernel Substituters
    nix.settings = lib.mkIf config.system.hardware.apple.applet2.substituters {
      inherit substituters;
      trusted-substituters = substituters;
      trusted-public-keys = ["hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q="];
    };
  };
}
