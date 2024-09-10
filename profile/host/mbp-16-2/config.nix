{inputs, ...}: let
  substituters = ["https://cache.soopy.moe"];
in {
  imports = [
    inputs.nixos-hardware.nixosModules.apple-t2 # NixOS Hardware import
    ./hardware-configuration.nix # NixOS Hardware configuration
    ../../../system/hardware/apple/apple-t2.nix
  ];

  system = {
    config = {
      zram.enable = true;
      unfree.enable = true;
      network.wgsupport = true;
      wifi.wpasupplicant = true;
      bluetooth.enable = true;
      pipewire = {
        enable = true;
        alsa.support32 = true;
      };
      touchpad.enable = true;
      backlight.enable = true;
    };
    system = {
      kernel.rustsupport = true;
    };
    hardware = {
      gpu.intel = {
        enable = true;
        support32 = true;
        opencl = true;
        monitoring = true;
      };
    };
  };

  # Nix settings
  nix.settings = {
    inherit substituters;
    trusted-substituters = substituters;
    trusted-public-keys = ["hydra.soopy.moe:IZ/bZ1XO3IfGtq66g+C85fxU/61tgXLaJ2MlcGGXU8Q="];
  };
}
