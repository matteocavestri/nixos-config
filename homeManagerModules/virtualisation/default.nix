{lib, ...}: {
  imports = [
    ./qemu.nix
    ./wine.nix
  ];

  user.virtualisation = {
    qemu = {
      enable = lib.mkDefault false;
      virtmanager.enable = lib.mkDefault false;
      tpm.enable = lib.mkDefault false;
      uefi.enable = lib.mkDefault false;
      defaultconnection = lib.mkDefault false;
    };
    wine = {
      enable = lib.mkDefault false;
      bottles = lib.mkDefault false;
      protonDir = lib.mkDefault false;
    };
  };
}
