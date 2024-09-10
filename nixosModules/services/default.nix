{lib, ...}: {
  imports = [
    ./desktop.nix
    ./quemuguest.nix
    ./server.nix
    ./slurm.nix
  ];

  system.services = {
    dconf.enable = lib.mkDefault false;
    dbus.enable = lib.mkDefault false;
    gvfs.enable = lib.mkDefault false;
    online-accounts.enable = lib.mkDefault false;
    qemuguest.enable = lib.mkDefault false;
    cockpit.enable = lib.mkDefault false;
    nvidia-monitoring.enable = lib.mkDefault false;
    slurm.enable = lib.mkDefault false;
  };
}
