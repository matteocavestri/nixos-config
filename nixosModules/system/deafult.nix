{
  imports = [
    ./bootloader.nix
  ];

  neve.system = {
    bootloader = {
      systemdBoot.enable = true;
      grub2.enable = false;
    };
  };
}
