{inputs, ...}: {
  imports = [
    inputs.nix-doom-emacs.hmModule
  ];
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d; # Directory containing your config.el, init.el
  };
  services.emacs.enable = true;
}
