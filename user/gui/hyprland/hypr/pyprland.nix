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

    [scratchpads.music]
    animation = "fromTop"
    command = "gnome-music"
    class = "org.gnome.Music"
    size = "75% 60%"
    max_size = "1920px 100%"
    margin = 50
    lazy = true
    excludes = "*"


    [scratchpads.volume]
    animation = "fromRight"
    command = "pwvucontrol"
    class = "com.saivert.pwvucontrol"
    lazy = "true"
    size = "40% 90%"
    max_size = "1080px 100%"
    unfocus = "hide"
    preserve_aspect = true
  '';
}
