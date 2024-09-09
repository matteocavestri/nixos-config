{
  pkgs,
  config,
  userSettings,
  ...
}: {
  home.packages = with pkgs; [
    fuzzel
  ];
  programs.fuzzel.enable = true;
  programs.fuzzel.settings = {
    main = {
      font = userSettings.appearance.font + ":size=16";
      dpi-aware = "no";
      show-actions = "yes";
      terminal = "${pkgs.kitty}/bin/kitty";
    };
    colors = {
      background = config.lib.stylix.colors.base00 + "bf";
      text = config.lib.stylix.colors.base07 + "ff";
      match = config.lib.stylix.colors.base05 + "ff";
      selection = config.lib.stylix.colors.base0B + "ff";
      selection-text = config.lib.stylix.colors.base00 + "ff";
      selection-match = config.lib.stylix.colors.base05 + "ff";
      border = config.lib.stylix.colors.base0B + "ff";
    };
    border = {
      width = 3;
      radius = 7;
    };
  };
}
