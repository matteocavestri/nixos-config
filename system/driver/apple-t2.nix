{ pkgs, ... }:
let substituters = [ "https://cache.soopy.moe" ];
in {
# Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" "repl-flake" ];

    inherit substituters;
    trusted-substituters = substituters;
    trusted-public-keys =
      [ "hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q=" ];
  };

# Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    systemd-boot.enable = true;
  };

# Apple T2 WiFi Firmware
  hardware.firmware = [
    (pkgs.stdenv.mkDerivation (final: {
      name = "brcm-firmware";
      src = /lib/firmware/brcm;
      installPhase = ''
        mkdir -p $out/lib/firmware/brcm
        cp ${final.src}/* "$out/lib/firmware/brcm"
      '';
    }))
  ];
}
