{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [
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
  environment.variables = {
    VDPAU_DRIVER = lib.mkIf config.hardware.opengl.enable (lib.mkDefault "va_gl");
  };
}
