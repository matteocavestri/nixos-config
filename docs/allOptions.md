# All Neve Options (WIP)

```nix
{
# ----- HARDWARE -----
  neve.hardware = {

# Generic Mesa GPU support
    gpu.enable = true;

# Intel hardware support
    intel = {
      cpu.enable = false;
      gpu = {
        enable = false;
        version = "1";
        monitoring.enable = false;
      };
    };

# Apple Devices and SoC support
    apple = {
      apple-t2 = {
        enable = false;
        enableAppleSetOsLoader = false;
        enableTinyDfr = true;
      };
    };
  };


# ----- CONFIG -----
  neve.config = {

# System/User Configurations
    systemVersion = "24.11";
    locale = "en_US.UTF-8";
    keyboardLayout = "us";
    timezone = "Europe/London";
    username = "neve";

# Nix Configurations
    nix = {
      linker.enable = true;
      garbageCollect.enable = true;
    };

# Peripherals Configurations
    peripherals = {
      backlight.enable = false;
      touchpad.enable = false;
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


# ----- SYSTEM -----
  neve.system = {

# Bootloader settings
    bootloader = {
      systemdBoot.enable = false;
      grub2.enable = true;
    };

# Kernel Settings
    kernel = {
      rust.enable = false;
      inotify = 512;
    };

# Zram/Swap settings
    zram.enable = false;
  };


# ----- DESKTOP -----
    neve.desktop = {
        gnome.enable = false;
    };
}
```
