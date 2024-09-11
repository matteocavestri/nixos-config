{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      atac.enable = lib.mkEnableOption "Install atac";
      sshs.enable = lib.mkEnableOption "Install sshs";
      termshark.enable = lib.mkEnableOption "Install termshark";
    };
  };
  config = {
    # Install atac (API tool)
    home.packages = with pkgs;
      lib.optionals config.user.packages.atac.enable [
        atac
      ]
      # Install sshs (ssh tool)
      ++ (lib.optionals config.user.packages.sshs.enable [
        sshs
      ])
      # Install termshark (security tool)
      ++ (lib.optionals config.user.packages.termshark.enable [
        termshark
      ]);
  };
}
