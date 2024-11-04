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

  config = lib.mkIf config.system.virtualisation.box64.enable {
    nixpkgs = lib.mkIf config.system.virtualisation.box64.support16k {
      overlays = [
        (self: super: {
          box64 = super.box64.overrideAttrs (oldAttrs: {
            cmakeFlags = [
              "-DM1=1"
              "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
            ];
            checkPhase = ''
              ctest --exclude-regex avx_intrinsics
            '';
          });
        })
      ];
    };

    # Install Box64
    environment.systemPackages = with pkgs; [
      box64
    ];
  };
}
