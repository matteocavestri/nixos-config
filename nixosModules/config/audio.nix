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
    # Sound is enabled if pipewire or pulseaudio are enabled
    sound.enable = lib.mkIf (config.system.config.pipewire.enable || config.system.config.pulseaudio.enable) true;

    # Pulseaudio configuration
    hardware.pulseaudio.enable = lib.mkIf config.system.config.pulseaudio.enable true;

    # Pipewire configuration
    services.pipewire = lib.mkIf config.system.config.pipewire.enable {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = lib.mkIf config.system.config.pipewire.alsa.support32 true;
      jack.enable = true;
      wireplumber.enable = true;
    };

    # RealtimeKit is enabled if sound is enabled
    security.rtkit.enable = lib.mkIf (config.system.config.pipewire.enable || config.system.config.pulseaudio.enable) true;
  };
}
