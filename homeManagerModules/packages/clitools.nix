{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      pass.enable = lib.mkEnableOption "Install pass";
    };
  };
  config = {
    home.packages = with pkgs;
      lib.optionals config.user.packages.pass.enable [
        pass
      ];
  };
}
