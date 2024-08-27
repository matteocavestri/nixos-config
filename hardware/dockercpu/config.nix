{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system/driver/qemuguest.nix
    ../../system/hardware/locale.nix
    ../../system/hardware/networkmanager.nix
    ../../system/hardware/zram.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
}
