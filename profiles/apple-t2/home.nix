{ pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = userSettings.editor;
    #SPAWNEDITOR = userSettings.spawnEditor;
    TERM = userSettings.term;
    BROWSER = userSettings.browser;
  };
  
  imports = [ 
# Default Import
    ../../user/config.nix
# Apps imports
    ../../user/apps/flatpak/flatpak.nix
    ../../user/apps/virtualization/virtualization.nix
    ../../user/apps/basepkgs/productivity.nix
    ../../user/apps/basepkgs/media.nix
    ../../user/apps/basepkgs/engineering.nix
    ../../user/apps/browsers/firefox.nix
# Development imports
    ../../user/lang/cc.nix
    ../../user/lang/go.nix
    ../../user/lang/lua.nix
    ../../user/lang/rust.nix
    ../../user/lang/python.nix
    ../../user/lang/javascript.nix
# Style imports
    #(if userSettings.wm == "hyprland" then ../../user/style/stylix.nix else null)
    #../../user/style/stylix.nix
# Window manager imports
    (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix")
  ];

  # home.packages = with pkgs; [ ];
}
