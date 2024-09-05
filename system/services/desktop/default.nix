{pkgs, ...}: {
  imports = [
    ./dconf.nix
    ./dbus.nix
  ];
  environment.systemPackages = with pkgs; [
    pinentry-gtk2
  ];
}
