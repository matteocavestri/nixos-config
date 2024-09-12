{userSettings, ...}: {
  imports = [
    ../minimal/home.nix
    (./. + "../../../../homeManagerModules/desktop" + ("/" + userSettings.wm + "/" + userSettings.wm) + ".nix") # Window manager import
  ];

  user = {
    packages = {
      flatpak = {
        enable = true;
        customizations = true;
      };
      kitty.enable = true;
      shell.zsh.enable = true;
      zellij.enable = true;
      firefox.enable = true;
      nevica = {
        enable = true;
      };
      langs = {
        go.enable = true;
        jvm.enable = true;
        web.enable = true;
        lua.enable = true;
        rust.enable = true;
        zig.enable = true;
        python.enable = true;
      };
      freecad.enable = true;
      kicad.enable = true;
      numbat.enable = true;
      octave.enable = true;
      gimp.enable = true;
      kdenlive.enable = true;
      obs.enable = true;
      mediatools.enable = true;
      libreoffice.enable = true;
      nextcloud-client.enable = true;
      protonmail-bridge.enable = true;
      atac.enable = true;
      sshs.enable = true;
      lf.enable = true;
    };
    virtualisation = {
      qemu = {
        enable = true;
        virtmanager.enable = true;
        tpm.enable = true;
        uefi.enable = true;
        defaultconnection = true;
      };
    };
  };
}
