{lib, ...}: {
  imports = [
    ./bootloader.nix
    ./kernelpatches.nix
  ];

  system.system = {
    boot.systemdboot.enable = lib.mkDefault true;
    kernel = {
      rustsupport = lib.mkDefault false;
      increaseInotify = lib.mkDefault false;
    };
  };
}
