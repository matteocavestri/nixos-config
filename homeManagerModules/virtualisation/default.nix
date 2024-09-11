{lib, ...}: {
  imports = [
    ./qemu.nix
  ];

  user.virtualisation = {
    qemu = {
      enable = lib.mkDefault false;
      virtmanager.enable = lib.mkDefault false;
      tpm.enable = lib.mkDefault false;
      uefi.enable = lib.mkDefault false;
      defaultconnection = lib.mkDefault false;
    };
  };
}
