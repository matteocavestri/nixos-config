{pkgs, ...}: {
  home.packages = with pkgs; [
    obs-studio
    obs-studio-plugins.obs-vkcapture
    obs-studio-plugins.obs-pipewire-audio-capture
    obs-studio-plugins.obs-backgroundremoval
  ];
}
