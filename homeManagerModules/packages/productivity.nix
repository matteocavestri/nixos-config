{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      libreoffice.enable = lib.mkEnableOption "Install LibreOffice";
      thunderbird.enable = lib.mkEnableOption "Install Thunderbird";
      nextcloud-client.enable = lib.mkEnableOption "Install Nextcloud client";
      protonmail-bridge.enable = lib.mkEnableOption "Install Protonmail bridge";
    };
  };
  config = {
    home.packages = with pkgs;
    # Install LibreOffice
      lib.optionals config.user.packages.libreoffice.enable [
        libreoffice
        hunspell
        hunspellDicts.en_GB-large
        hunspellDicts.it_IT
      ]
      # Install Thunderbird
      ++ (lib.optionals config.user.packages.thunderbird.enable [
        thunderbird
      ])
      # Install Nextcloud client
      ++ (lib.optionals config.user.packages.nextcloud-client.enable [
        nextcloud-client
      ])
      # Install Protonmail bridge
      ++ (lib.optionals config.user.packages.protonmail-bridge.enable [
        protonmail-bridge
      ]);
  };
}
