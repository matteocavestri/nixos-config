{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      gimp.enable = lib.mkEnableOption "Install Gimp";
      kdenlive.enable = lib.mkEnableOption "Install Kdenlive";
      obs = {
        enable = lib.mkEnableOption "Install OBS";
        withplugins = lib.mkEnableOption "Install OBS plugins";
      };
      mediatools.enable = lib.mkEnableOption "Install media tools";
    };
  };
  config = {
    home.packages = with pkgs;
    # Install Gimp
      lib.optionals config.user.packages.gimp.enable [
        gimp
      ]
      # Install Kdenlive
      ++ (lib.optionals config.user.packages.kdenlive.enable [
        kdePackages.kdenlive
      ])
      # Install OBS minimal
      ++ (lib.optionals config.user.packages.obs.enable [
        obs-studio
      ])
      # Install OBS plugins
      ++ (lib.optionals (config.user.packages.obs.withplugins && config.user.packages.obs.enable) [
        obs-studio-plugins.obs-vkcapture
        obs-studio-plugins.obs-pipewire-audio-capture
        obs-studio-plugins.obs-backgroundremoval
      ])
      # Install media tools
      ++ (lib.optionals config.user.packages.mediatools.enable [
        clinfo
        libva-utils
        vulkan-tools
        mesa-demos
        cava
      ]);
  };
}
