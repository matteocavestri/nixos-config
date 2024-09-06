{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./dbus.nix
    ./gvfs.nix
  ];
  environment.systemPackages = with pkgs; [
    pinentry-gtk2
  ];
}
