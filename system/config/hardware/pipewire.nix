{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../../security/rtkit.nix
  ];
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };
  environment.systemPackages = with pkgs; [
    wireplumber
  ];
}
