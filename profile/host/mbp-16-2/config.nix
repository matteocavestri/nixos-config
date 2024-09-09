{
  pkgs,
  inputs,
  systemSettings,
  ...
}: let
  substituters = ["https://cache.soopy.moe"];
in {
  imports = [
    inputs.nixos-hardware.nixosModules.apple-t2 # NixOS Hardware import
    ./hardware-configuration.nix # NixOS Hardware configuration
    ../../../system/config/hardware/kernel-rust.nix # Kernel rust patch
    ../../../system/config/hardware/wpa_supplicant.nix # WPA Supplicant
    ../../../system/config/hardware/bluetooth.nix # Bluetooth
    ../../../system/config/hardware/pipewire.nix # Audio
    ../../../system/config/hardware/touchpad.nix # Touchpad
    ../../../system/config/hardware/backlight.nix # Backlight
    ../../../system/hardware/apple/apple-t2.nix
    ../../../system/hardware/intel/intelgpu.nix # GPU
    # ../../../system/config/optimization/zram.nix # ZRAM
  ];

  system.config.zram.enable = true;

  # Nix settings
  nix.settings = {
    inherit substituters;
    trusted-substituters = substituters;
    trusted-public-keys = ["hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q="];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    systemd-boot.enable = true;
  };
}
