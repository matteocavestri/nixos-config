{inputs, ...}: {
  imports = [
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];
  programs.plasma = {
    krunner = {
      activateWhenTypingOnDesktop = true;
      historyBehavior = "enableSuggestions";
      position = "center";
    };
  };
}
