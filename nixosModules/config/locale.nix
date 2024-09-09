{
  systemSettings,
  lib,
  config,
  ...
}: {
  options = {
    system.config.locale.enable = lib.mkEnableOption "Enable locale configuration";
  };

  config = lib.mkIf config.system.config.locale.enable {
    time.timeZone = systemSettings.host.timezone;
    i18n = {
      defaultLocale = systemSettings.host.locale;
      extraLocaleSettings = {
        LC_ADDRESS = systemSettings.host.locale;
        LC_IDENTIFICATION = systemSettings.host.locale;
        LC_MEASUREMENT = systemSettings.host.locale;
        LC_MONETARY = systemSettings.host.locale;
        LC_NAME = systemSettings.host.locale;
        LC_NUMERIC = systemSettings.host.locale;
        LC_PAPER = systemSettings.host.locale;
        LC_TELEPHONE = systemSettings.host.locale;
        LC_TIME = systemSettings.host.locale;
      };
    };
    console = {
      keyMap = systemSettings.host.keymap;
    };
  };
}
