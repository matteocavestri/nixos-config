{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    system.virtualisation.box64 = {
      enable = lib.mkEnableOption "Install Box64";
      support16k = lib.mkEnableOption "Support 16k kernel pages for Box64 (Apple-M1 Requirement)";
    };
  };

  # Box64 configuration
  config = lib.mkIf config.system.virtualisation.box64.enable {
    # Nixpkgs override for 16k kernel pages support
    nixpkgs = lib.mkIf config.system.virtualisation.box64.support16k {
      overlays = [
        (self: super: {
          box64-16k = super.box64.overrideAttrs (oldAttrs: {
            cmakeFlags = [
              "-DM1=1"
              "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
            ];
          });
        })
      ];
    };

    # Install Box64
    environment.systemPackages = with pkgs;
      [
        box64
      ]
      # Install 16k kernel pages if requested
      ++ (lib.optionals config.system.virtualisation.box64.support16k [
        box64-16k
      ]);
  };
}
