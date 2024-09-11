{inputs, ...}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];
  programs.plasma = {
    panels = [
      {
        location = "top";
        screen = "all";
        height = 26;
        floating = true;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.volume"
              ];
              hidden = [
                "org.kde.plasma.notifications"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            digitalClock = {
              calendar = {
                firstDayOfWeek = "monday";
                showWeekNumbers = true;
              };
              date.format.custom = "ddd";
              time.format = "24h";
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.notifications"
        ];
      }
    ];
  };
}
