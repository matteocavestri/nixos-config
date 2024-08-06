{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/driver/apple-silicon/default.nix
    ../../system/hardware/bluetooth.nix
    ../../system/hardware/locale.nix
    ../../system/hardware/iwd.nix
    # ../../system/hardware/pipewire.nix
    # ../../system/hardware/systemdboot.nix
    # ../../system/hardware/touchpad.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Apple T2 WiFi firmware
  hardware.asahi.peripheralFirmwareDirectory = /etc/nixos/firmware;
  # hardware.firmware = [
  #   (pkgs.stdenv.mkDerivation (final: {
  #     name = "brcm-firmware";
  #     src = /lib/firmware/brcm;
  #     installPhase = ''
  #       mkdir -p $out/lib/firmware/brcm
  #       cp ${final.src}/* "$out/lib/firmware/brcm"
  #     '';
  #   }))
  # ];
}
