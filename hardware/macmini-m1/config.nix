{
  imports = [
    ./hardware-configuration.nix
    ../../system/driver/applegpu.nix
    ../../system/driver/apple-silicon/default.nix
    ../../system/hardware/bluetooth.nix
    ../../system/hardware/iwd.nix
    ../../system/hardware/zram.nix
    ../../system/pkgs/box64-16k.nix
  ];
  # Nix settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "repl-flake"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  systemd.services."app-pulseaudio@autostart" = {
    enable = false;
  };
}
