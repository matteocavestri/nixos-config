{inputs, ...}: {
  imports = [
    inputs.nixos-hardware.nixosModules.apple-t2 # NixOS Hardware import
    ./hardware-configuration.nix # NixOS Hardware configuration
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
      apple.applet2 = {
        enable = true;
        substituters = true;
      };
    };
    packages.steam.enable = true;
  };
}
