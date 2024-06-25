# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

# Shell configuration
  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

# Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    systemd-boot.enable = true;
  };


# Networking Configuration
  networking.hostName = "nixos-t2";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Apple WiFi Firmware
  hardware.firmware = [
    (pkgs.stdenv.mkDerivation (final: {
      name = "brcm-firmware";
      src = /lib/firmware/brcm;
      installPhase = ''
        mkdir -p $out/lib/firmware/brcm
        cp ${final.src}/* "$out/lib/firmware/brcm"
      '';
    }))
  ];


# General settings
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "it_IT.UTF-8";
  console = {
    keyMap = "it";
  };


# Enable the X11 windowing system.
  services.xserver.enable = true;  
  services.xserver.xkb.layout = "it";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";


# Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = lib.mkForce false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };

  
# Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
     enableSSHSupport = true;
  };

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matteocavestri = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };


# System Packages
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    neovim
    emacs
    wget
    git
    tmux
    pinentry-gtk2
    gnupg
  ];

# Font settings
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [ 
      jetbrains-mono
      inconsolata-nerdfont
      #(nerdfonts.override { fonts = [ "Inconsolata" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [  "Inconsolata Nerd Font" ];
        sansSerif = [ "Inconsolata Nerd Font" ];
        monospace = [ "Inconsolata Nerd Font Mono" ];
      };
    };
  };

# Some programs need SUID wrappers, can be configured further or are started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


# List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


# This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?


# Experimental Features  
  nix.settings.experimental-features = ["nix-command" "flakes"];
}

