{lib, ...}: {
  imports = [
    ./config/default.nix
    ./hardware/default.nix
    ./packages/default.nix
    ./security/default.nix
    ./services/default.nix
    ./system/default.nix
    ./virtualisation/default.nix
  ];

  system = {
    # Configuration Default settings
    config = {
      locale.enable = lib.mkDefault true;
      zram.enable = lib.mkDefault false;
      garbagecollect.enable = lib.mkDefault true;
      fonts.enable = lib.mkDefault true;
      flake.enable = lib.mkForce true;
      unfree.enable = lib.mkDefault false;
      linker.enable = lib.mkDefault true;
      users.enable = lib.mkForce true;
      network = {
        enable = lib.mkDefault true;
        wgsupport = lib.mkDefault false;
      };
      wifi = {
        wpasupplicant = lib.mkDefault false;
        iwd = lib.mkDefault false;
      };
      bluetooth.enable = lib.mkDefault false;
      pipewire = {
        enable = lib.mkDefault false;
        alsa.support32 = lib.mkDefault false;
      };
      pulseaudio.enable = lib.mkDefault false;
      backlight.enable = lib.mkDefault false;
      touchpad.enable = lib.mkDefault false;
      iio.enable = lib.mkDefault false;
    };

    # Hardware Default settings
    hardware = {
      gpu = {
        enable = lib.mkDefault false;
        support32 = lib.mkDefault false;
        intel = {
          enable = lib.mkDefault false;
          support32 = lib.mkDefault false;
          opencl = lib.mkDefault false;
          newgpu = lib.mkDefault false;
          monitoring = lib.mkDefault false;
        };
        nvidia = {
          enable = lib.mkDefault false;
          open = lib.mkDefault false;
          nvidia-settings = lib.mkDefault false;
          monitoring = lib.mkDefault false;
          cuda = lib.mkDefault false;
          cudnn = lib.mkDefault false;
        };
      };
      apple = {
        applet2 = {
          enable = lib.mkDefault false;
          substituters = lib.mkDefault false;
        };
      };
    };

    # Packages Default settings
    packages = {
      basepkgs.enable = lib.mkDefault true;
      steam.enable = lib.mkDefault false;
      packaging = {
        flatpak.enable = lib.mkDefault false;
        appimage.enable = lib.mkDefault false;
      };
    };

    # Security Default settings
    security = {
      server = {
        openssh = {
          enable = lib.mkDefault false;
          password = lib.mkDefault true;
        };
      };
      sudors.enable = lib.mkDefault false;
      gpg.enable = lib.mkDefault true;
      gnome-keyring.enable = lib.mkDefault false;
      polkit.enable = lib.mkDefault false;
      network = {
        dnscrypt = {
          enable = lib.mkDefault false;
          ipv6 = lib.mkDefault false;
        };
      };
    };

    # Services Default settings
    services = {
      dconf.enable = lib.mkDefault false;
      dbus.enable = lib.mkDefault false;
      gvfs.enable = lib.mkDefault false;
      online-accounts.enable = lib.mkDefault false;
      qemuguest.enable = lib.mkDefault false;
      cockpit.enable = lib.mkDefault false;
      nvidia-monitoring.enable = lib.mkDefault false;
      slurm.enable = lib.mkDefault false;
      wayland.enable = lib.mkDefault false;
      xorg.enable = lib.mkDefault false;
      stylix.enable = lib.mkDefault true;
      displaymanager = {
        sddm.enable = lib.mkDefault false;
        lightdm.enable = lib.mkDefault false;
      };
    };

    # System Default settings
    system = {
      boot.systemdboot.enable = lib.mkDefault true;
      kernel.rustsupport = lib.mkDefault false;
    };

    # virtualisation Default settings
    virtualisation = {
      qemu = {
        enable = lib.mkDefault false;
        winsupport = lib.mkDefault false;
      };
      docker = {
        enable = lib.mkDefault false;
        nvidiasupport = lib.mkDefault false;
      };
      podman.enable = lib.mkDefault false;
      distrobox.enable = lib.mkDefault false;
      wine = {
        enable = lib.mkDefault false;
        support32 = lib.mkDefault false;
      };
      waydroid.enable = lib.mkDefault false;
      box64 = {
        enable = lib.mkDefault false;
        support16k = lib.mkDefault false;
      };
    };
  };

  # Asahi specific settings
  hardware.asahi = {
    enable = lib.mkDefault false;
    withRust = lib.mkDefault true;
    peripheralFirmwareDirectory = lib.mkDefault /etc/nixos/firmware;
    useExperimentalGPUDriver = lib.mkDefault true;
    experimentalGPUInstallMode = lib.mkDefault "replace";
    setupAsahiSound = lib.mkDefault true;
  };
}
