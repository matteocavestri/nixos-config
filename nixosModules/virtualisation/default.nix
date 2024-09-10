{lib, ...}: {
  imports = [
    ./qemu.nix
  ];

  system.virtualisation = {
    qemu = {
      enable = lib.mkDefault false;
      winsupport = lib.mkDefault false;
    };
  };
}
