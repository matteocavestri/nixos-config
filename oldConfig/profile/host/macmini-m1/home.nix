{lib, ...}: {
  user.packages = {
    minecraft.enable = true;
    mangohud.enable = true;
    gamemode.enable = true;
    kube.enable = true;
    librewolf.enable = true;
    torBrowser.enable = lib.mkForce false;
    nevica.neovide = lib.mkForce true;
  };
}
