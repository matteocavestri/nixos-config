{
  imports = [
    ../minimal/home.nix
  ];

  user = {
    virtualisation = {
      qemu = {
        enable = true;
        virtmanager.enable = false;
        tpm.enable = true;
        uefi.enable = true;
        defaultconnection = false;
      };
    };
  };
}
