{lib, ...}: {
  imports = [
    ./desktop.nix
  ];

  system.services = {
    dconf.enable = lib.mkDefault false;
    dbus.enable = lib.mkDefault false;
    gvfs.enable = lib.mkDefault false;
    online-accounts.enable = lib.mkDefault false;
  };
}