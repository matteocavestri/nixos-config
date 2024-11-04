{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    user.packages.nevica = {
      enable = lib.mkEnableOption "Enable Nevica editor";
      neovide = lib.mkEnableOption "Enable neovide";
    };
  };

  config = {
    # Install Nevica Full Text editor
    home.packages =
      lib.optionals config.user.packages.nevica.enable [
        inputs.nevica.packages.${pkgs.system}.nevica-full
      ]
      # Install Neovide for GUI
      ++ (lib.optionals (config.user.packages.nevica.enable && config.user.packages.nevica.neovide) [
        pkgs.neovide
      ]);
  };
}
