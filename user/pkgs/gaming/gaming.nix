{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    prismlauncher
    lutris
    heroic
    mangohud
    protonup
    protontricks
    dxvk
    vkd3d
  ];

  programs.mangohud.enable = true;

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };
}
