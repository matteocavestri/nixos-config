{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (sddm-chili-theme.override {
      themeConfig = {
        background = config.stylix.image;
        ScreenWidth = 1536;
        ScreenHeight = 960;
        blur = true;
        recursiveBlurLoops = 3;
        recursiveBlurRadius = 5;
      };
    })
  ];
  # Configure xwayland
  services = {
    xserver = {
      enable = true;
    };
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        enableHidpi = true;
        theme = "chili";
        package = pkgs.sddm;
      };
    };
  };
}
