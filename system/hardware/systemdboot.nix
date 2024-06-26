{ ... }:

{
# Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    systemd-boot.enable = true;
  };
}
