{
  imports = [
    ../server/home.nix
    ../../../homeManagerModules/virtualisation/default.nix
  ];

  user = {
    virtualisation = {
      qemu = {
        enable = true;
        virtmanager.enable = true;
        tpm.enable = true;
        uefi.enable = true;
        defaultconnection = true;
      };
    };
  };
}
