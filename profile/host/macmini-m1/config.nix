{
  imports = [
    ./hardware-configuration.nix
    ../../../system/hardware/apple/applegpu.nix
    ../../../system/hardware/apple/apple-silicon/default.nix
    ../../../system/config/hardware/iwd.nix
    ../../../system/config/hardware/bluetooth.nix
    ../../../system/config/optimization/zram.nix
    ../../../system/services/transemu/box64-16k.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
}
