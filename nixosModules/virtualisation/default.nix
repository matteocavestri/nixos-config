{lib, ...}: {
  imports = [
    ./qemu.nix
    ./docker.nix
  ];

  system.virtualisation = {
    qemu = {
      enable = lib.mkDefault false;
      winsupport = lib.mkDefault false;
    };
    docker = {
      enable = lib.mkDefault false;
      nvidiasupport = lib.mkDefault false;
    };
  };
}
