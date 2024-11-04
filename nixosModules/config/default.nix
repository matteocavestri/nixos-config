{
  imports = [
    ./nix.nix
    ./locale.nix
    ./users.nix
    ./peripherals.nix
    ./network.nix
  ];

  # Default values
  neve.config = {
    # System/User Configurations
    systemVersion = "24.11";
    locale = "en_US.UTF-8";
    keyboardLayout = "us";
    timezone = "Europe/London";
    username = "neve";

    # Nix Configurations
    linker.enable = true;
    garbageCollect.enable = true;

    # Peripherals Configurations
    peripherals = {
      backlight.enable = false;
      touchpad.enable = true;
      iio.enable = false;
    };

    # Networking Configurations
    network = {
      hostname = "nixos";
      wifiBackend = "iwd";
      wireguardSupport.enable = true;
      bluetooth.enable = false;
    };

    # Audio Configurations
    audio = {
      pulseaudio = false;
      pipewire = {
        enable = false;
        alsa32.enable = false;
      };
    };
  };
}
