{
  pkgs,
  userSettings,
  ...
}: {
  home.packages = [pkgs.git];
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = userSettings.user.name;
    userEmail = userSettings.user.email;
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = [
        ("/home/" + userSettings.user.username + "/.dotfiles")
        ("/home/" + userSettings.user.username + "/.dotfiles/.git")
      ];
    };
  };
}
