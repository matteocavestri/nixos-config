{ config, lib, pkgs, ... }:

{
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
  };
}
