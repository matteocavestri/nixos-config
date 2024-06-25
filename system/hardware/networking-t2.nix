{ pkgs, systemSettings, ... }:
{
# Networking Configuration
  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Apple WiFi Firmware
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
