{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/driver/applegpu.nix
    ../../system/driver/apple-silicon/default.nix
    ../../system/hardware/bluetooth.nix
    ../../system/hardware/locale.nix
    ../../system/hardware/iwd.nix
    ../../system/hardware/zram.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
}
