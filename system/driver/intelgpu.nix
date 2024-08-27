{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        (
          if (lib.versionOlder (lib.versions.majorMinor lib.version) "23.11")
          then vaapiIntel
          else intel-vaapi-driver
        )
        # libvdpau-va-gl
        vaapiVdpau
        intel-media-driver
        intel-media-sdk
        intel-ocl
        libGLU
      ];
    };
  };
  environment.variables = {
    VDPAU_DRIVER = lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");
  };
  environment.systemPackages = with pkgs; [
    nvtopPackages.intel
  ];
}
