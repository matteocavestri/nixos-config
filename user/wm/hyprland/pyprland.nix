{ ... }:

{
    home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["expose"]

    [workspaces_follow_focus]
    max_workspaces = 9

    [expose]
    include_special = false
  '';
}
