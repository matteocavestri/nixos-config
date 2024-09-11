{lib, ...}: {
  imports = [
    ./editor.nix
    ./flatpak.nix
    ./code.nix
    ./engineering.nix
    ./media.nix
    ./productivity.nix
    ./gaming.nix
    ./tuitools.nix
    ./terminal.nix
    ./clitools.nix
  ];

  user.packages = {
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
    mediatools.enable = lib.mkDefault true;
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
  };
}
