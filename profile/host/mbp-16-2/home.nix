{lib, ...}: {
  user.packages = {
    kube.enable = true;
    librewolf.enable = lib.mkForce true;
    nevica = {
      enable = lib.mkForce true;
      neovide = lib.mkForce true;
    };
  };
}
