{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gamemode
    steam
    steamPackages.steam-runtime
    steam-run
    gamescope
  ];
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
