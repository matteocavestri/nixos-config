{
  lib,
  userSettings,
  ...
}: let
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../../themes" + ("/" + userSettings.theme) + "/polarity.txt"));
  myLightDMTheme =
    if themePolarity == "light"
    then "Adwaita"
    else "Adwaita-dark";
in {
  imports = [
    ../../style/stylix.nix
  ];
  services = {
    xserver = {
      enable = true;
      displayManager.lightdm = {
        enable = true;
        greeters.slick.enable = true;
        greeters.slick.theme.name = myLightDMTheme;
      };
    };
  };
}
