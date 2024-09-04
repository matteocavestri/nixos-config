{
  imports = [
    ./hardware-configuration.nix
    ../../../system/config/hardware/systemdboot.nix # Bootloader
    ../../../system/config/hardware/iwd.nix
    ../../../system/config/hardware/bluetooth.nix
    ../../../system/config/optimization/zram.nix
    ../../../system/services/transemu/box64-16k.nix
    ../../../system/hardware/apple/apple-silicon/default.nix
  ];
}
