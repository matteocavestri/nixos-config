{ config, pkgs, userSettings, ... }:

{
  environment.systemPackages = with pkgs; [ virt-manager ];
  virtualisation.libvirtd = {
    allowedBridges = [
      "nm-bridge"
      "virbr0"
    ];
    enable = true;
    qemu.runAsRoot = false;
    #users.users.${userSettings.username}.extraGroups = [ "kvm" ];
  };
}
