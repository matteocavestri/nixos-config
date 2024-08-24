{userSettings, ...}: {
  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;
    stateVersion = "24.05";
    sessionVariables = {
      EDITOR = userSettings.editor;
      TERM = userSettings.term;
      BROWSER = userSettings.browser;
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ../../user/shell/sh.nix # Shell config
    ../../user/pkgs/git/git.nix # Git config
    ../../user/pkgs/terminal/nh.nix # nh (nixos/homemanager) config
    ../../user/pkgs/terminal/lf.nix
    ../../user/pkgs/coding/compiler.nix
    ../../user/pkgs/coding/tools.nix
  ];
}
