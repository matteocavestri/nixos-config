{ pkgs, userSettings, ... }:

{
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "libvirtd" "qemu-libvirtd" "kvm" ]; # Enable ‘sudo’ for the user.
    #packages = with pkgs; [
    #  firefox
    #  tree
    #];
  };
}
