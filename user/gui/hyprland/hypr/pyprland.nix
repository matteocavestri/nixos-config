{pkgs, ...}: {
  home.packages = with pkgs; [
    pyprland
  ];
  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["expose", "scratchpads"]

    #[workspaces_follow_focus]
    #max_workspaces = 9

    #[expose]
    #include_special = false

    [scratchpads.term]
    animation = "fromTop"
    command = "kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    size = "75% 60%"
    max_size = "1920px 100%"
    margin = 50
  '';
}
