{ pkgs, ... }:
{
  services.xserver.desktopManager.cde.enable = true;
  services.xserver.desktopManager.cde.extraPackages = with pkgs;
    options.services.xserver.desktopManager.cde.extraPackages.default ++ [
      fsv cde-icons cde-gtk-theme cde-battery
    ];
  environment.etc."xdg/gtk-2.0/gtkrc".text = ''
    gtk-theme-name="cdetheme"
  '';
  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name=cdetheme
  '';
  qt5 = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };
}
