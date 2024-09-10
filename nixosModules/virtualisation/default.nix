{lib, ...}: {
  imports = [
    ./qemu.nix
    ./docker.nix
    ./podman.nix
    ./wine.nix
    ./waydroid.nix
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
    wine = {
      enable = lib.mkDefault false;
      support32 = lib.mkDefault false;
      wayland = lib.mkDefault false;
    };
    waydroid.enable = lib.mkDefault false;
  };
}
