{ ... }:

{
  imports = [
    ./apps/basepkgs.nix
    ./hardware/locale.nix
    ./hardware/systemd.nix
    ./hardware/networking.nix
    ./security/gpg.nix
    ./security/users.nix
  ];
}
