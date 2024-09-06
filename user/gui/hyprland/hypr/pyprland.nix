{pkgs, ...}: {
  home.packages = with pkgs; [
    pyprland
  ];
  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["expose", "scratchpads", "magnify"]

    #[workspaces_follow_focus]
    #max_workspaces = 9

    #[expose]
    #include_special = false

    [scratchpads.term]
    command = "kitty --class scratchpad"
    margin = 50

    [scratchpads.lf]
    command = "kitty --class scratchpad -e lf"
    margin = 50

    [scratchpads.numbat]
    command = "alacritty --class scratchpad -e numbat"
    margin = 50

    [scratchpads.btm]
    command = "alacritty --class scratchpad -e btop"
    margin = 50
  '';
}
