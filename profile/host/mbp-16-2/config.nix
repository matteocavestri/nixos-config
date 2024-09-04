{
  pkgs,
  inputs,
  systemSettings,
  ...
}: let
  substituters = ["https://cache.soopy.moe"];
in {
  imports = [
    inputs.nixos-hardware.nixosModules.${systemSettings.nix.hardware} # NixOS Hardware import
    ./hardware-configuration.nix # NixOS Hardware configuration
    ../../../system/config/hardware/kernel-rust.nix # Kernel rust patch
    ../../../system/config/hardware/wpa_supplicant.nix # WPA Supplicant
    ../../../system/config/hardware/bluetooth.nix # Bluetooth
    ../../../system/config/hardware/pipewire.nix # Audio
    ../../../system/config/hardware/touchpad.nix # Touchpad
    ../../../system/config/hardware/backlight.nix # Backlight
    ../../../system/config/hardware/systemdboot.nix # Bootloader
    ../../../system/hardware/intel/intelgpu.nix # GPU
    ../../../system/config/optimization/zram.nix # ZRAM

    # ../../system/driver/intelgpu.nix
    # ../../system/hardware/bluetooth.nix
    # ../../system/hardware/wpa_supplicant.nix
    # ../../system/hardware/pipewire.nix
    # ../../system/hardware/systemdboot.nix
    # ../../system/hardware/touchpad.nix
    # ../../system/hardware/zram.nix
    # ../../system/hardware/backlight.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];

    inherit substituters;
    trusted-substituters = substituters;
    trusted-public-keys = ["hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q="];
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
