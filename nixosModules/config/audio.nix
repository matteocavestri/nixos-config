{
  lib,
  config,
  ...
}: {
  options = {
    system.config = {
      pipewire = {
        enable = lib.mkEnableOption "Enable Pipewire";
        alsa.support32 = lib.mkEnableOption "Support 32-bit alsa";
      };
      pulseaudio.enable = lib.mkEnableOption "Enable pulseaudio";
    };
  };

  config = {
    sound.enable = config.system.config.pipewire.enable || config.system.config.pulseaudio.enable;
    hardware.pulseaudio.enable = lib.mkIf config.system.config.pulseaudio.enable true;
    services.pipewire = {
      enable = lib.mkIf config.system.config.pipewire.enable true;
      audio.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = lib.mkIf config.system.config.pipewire.alsa.support32 true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    security.rtkit.enable =
      config.system.config.pipewire.enable || config.system.config.pulseaudio.enable;
  };
}
