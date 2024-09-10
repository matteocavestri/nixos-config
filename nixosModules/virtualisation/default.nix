{lib, ...}: {
  imports = [
    ./qemu.nix
    ./docker.nix
    ./podman.nix
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
    podman.enable = lib.mkDefault false;
    distrobox.enable = lib.mkDefault false;
  };
}
