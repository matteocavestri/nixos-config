{inputs, ...}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];
  programs.plasma = {
    panels = [
      {
        location = "bottom";
        height = 44;
        floating = true;
        hiding = "dodgewindows";
        lengthMode = "fit";
        widgets = [
          {
            iconTasks = {
              launchers = [
                "applications:firefox.desktop"
                "applications:org.gnome.Nautilus.desktop"
                "applications:thunderbird.desktop"
                "applications:org.gnome.Calendar.desktop"
                "applications:org.gnome.World.Iotas.desktop"
                "applications:org.gnome.Todo.desktop"
                "applications:startcenter.desktop"
                "applications:kitty.desktop"
                "applications:systemsettings.desktop"
              ];
            };
          }
        ];
      }
    ];
  };
}
