{systemSettings, ...}: {
  imports = [
    (./. + "../../../../profile/host" + ("/" + systemSettings.profile.host) + "/home.nix")
    ../../../homeManagerModules/default.nix
  ];
}
