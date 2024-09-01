{pkgs, ...}: {
  nixpkgs.overlays = [
    (self: super: {
      box64 = super.box64.overrideAttrs (oldAttrs: {
        cmakeFlags = [
          "-DM1=1"
          "-DCMAKE_BUILD_TYPE=RelWithDebInfo"
        ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    box64
  ];
}
