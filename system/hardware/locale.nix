{ systemSettings, ... }:

{
# General settings
  time.timeZone = systemSettings.timezone;
  i18n.defaultLocale = systemSettings.locale ;
  console = {
    keyMap = systemSettings.keymap;
  };
}
