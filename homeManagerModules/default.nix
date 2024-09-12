{lib, ...}: {
  imports = [
    ./config/default.nix
    ./packages/default.nix
    ./services/default.nix
    ./virtualisation/default.nix
  ];

  user = {
    # Home manager default configuration
    config = {
      homemanager.enable = lib.mkDefault true;
    };

    # Home manager default packages
    packages = {
      nevica = {
        enable = lib.mkDefault false;
        neovide = lib.mkDefault false;
      };
      flatpak = {
        enable = lib.mkDefault false;
        customizations = lib.mkDefault false;
      };
      langs = {
        c.enable = lib.mkDefault true;
        go.enable = lib.mkDefault false;
        jvm.enable = lib.mkDefault false;
        web.enable = lib.mkDefault false;
        lua.enable = lib.mkDefault false;
        rust.enable = lib.mkDefault false;
        zig.enable = lib.mkDefault false;
        python.enable = lib.mkDefault false;
      };
      git.enable = lib.mkDefault true;
      freecad.enable = lib.mkDefault false;
      kicad.enable = lib.mkDefault false;
      numbat.enable = lib.mkDefault false;
      octave.enable = lib.mkDefault false;
      gimp.enable = lib.mkDefault false;
      kdenlive.enable = lib.mkDefault false;
      obs = {
        enable = lib.mkDefault false;
        withplugins = lib.mkDefault false;
      };
      mediatools.enable = lib.mkDefault false;
      libreoffice.enable = lib.mkDefault false;
      thunderbird.enable = lib.mkDefault false;
      nextcloud-client.enable = lib.mkDefault false;
      protonmail-bridge.enable = lib.mkDefault false;
      minecraft.enable = lib.mkDefault false;
      gamemode.enable = lib.mkDefault false;
      mangohud.enable = lib.mkDefault false;
      lutris.enable = lib.mkDefault false;
      heroic.enable = lib.mkDefault false;
      atac.enable = lib.mkDefault false;
      sshs.enable = lib.mkDefault false;
      termshark.enable = lib.mkDefault false;
      lf.enable = lib.mkDefault false;
      kitty.enable = lib.mkDefault false;
      alacritty.enable = lib.mkDefault false;
      pass.enable = lib.mkDefault false;
      neofetch.enable = lib.mkDefault false;
      shell = {
        bash.enable = lib.mkDefault true;
        zsh.enable = lib.mkDefault true;
        ohmyposh.enable = lib.mkDefault false;
        direnv.enable = lib.mkDefault true;
        defaultpkgs = lib.mkDefault true;
      };
      tmux.enable = lib.mkDefault false;
      zellij.enable = lib.mkDefault false;
      firefox.enable = lib.mkDefault false;
      desktopsuite.enable = lib.mkDefault false;
    };

    # Home manager default services
    services = {
      stylix.enable = lib.mkDefault false;
      gtkstyle.enable = lib.mkDefault false;
      qtstyle.enable = lib.mkDefault false;
    };

    #Home manager default virtualisation
    virtualisation = {
      qemu = {
        enable = lib.mkDefault false;
        virtmanager.enable = lib.mkDefault false;
        tpm.enable = lib.mkDefault false;
        uefi.enable = lib.mkDefault false;
        defaultconnection = lib.mkDefault false;
      };
      wine = {
        enable = lib.mkDefault false;
        bottles = lib.mkDefault false;
        protonDir = lib.mkDefault false;
      };
    };
  };
}
