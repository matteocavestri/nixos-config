{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./dbus.nix
    ./gvfs.nix
    ./online-accounts.nix
  ];
  environment.systemPackages = with pkgs; [
    pinentry-gtk2
  ];
}
