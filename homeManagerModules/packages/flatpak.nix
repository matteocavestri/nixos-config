{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages.flatpak = {
      enable = lib.mkEnableOption "Enable Flatpak and install gnome software";
      customizations = lib.mkEnableOption "Enable flatpak customizations";
    };
  };
  config = {
    home = {
      # Flatpak packages
      packages = lib.optionals config.user.packages.flatpak.enable [
        pkgs.flatpak
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "24.05")
          then pkgs.gnome-software
          else pkgs.gnome.gnome-software
        )
      ];

      # Flatpak customizations
      sessionVariables = lib.mkIf config.user.packages.flatpak.customizations {
        XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"; # lets flatpak work
      };
    };
  };
}
