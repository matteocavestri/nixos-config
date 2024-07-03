{ userSettings, config, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x30";
        origin = "top-right";
        transparency = 10;
        frame_color = "#${config.lib.stylix.colors.base0E}";
        font = "${userSettings.font}";
      };

      urgency_normal = {
        background = "#${config.lib.stylix.colors.base01}";
        foreground = "#${config.lib.stylix.colors.base05}";
        timeout = 5;
      };
        };
      };
}
