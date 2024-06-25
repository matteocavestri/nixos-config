{ pkgs, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matteocavestri = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      tree
    ];
  };
}
