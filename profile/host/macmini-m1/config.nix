{
  imports = [
    ./hardware-configuration.nix
    ../../../system/hardware/apple/apple-silicon/default.nix
  ];

  system = {
    config = {
      zram.enable = true;
      unfree.enable = true;
      network.wgsupport = true;
      wifi.iwd = true;
      bluetooth.enable = true;
      pipewire = {
        enable = true;
      };
    };
    system.kernel.rustsupport = true;
    virtualisation.box64 = {
      enable = true;
      support16k = true;
    };
  };
}
