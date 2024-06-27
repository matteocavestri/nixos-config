{ pkgs, ... }:

{
  services.hyprpaper ={
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset =2.0;

      preload = ["/home/matteocavestri/Scaricati/various-os-1-4k.png"];

      wallpaper = ["eDP-1,/home/matteocavestri/Scaricati/various-os-1-4k.png"];
    };
  };
}
