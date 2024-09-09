{pkgs, ...}: {
  home.packages = with pkgs; [
    blueman
    killall
    hyprcursor
    hyprpaper
    hyprland-protocols
    pwvucontrol
    (pkgs.writeShellScriptBin "hypreload" ''
      #!/bin/sh

      restart_process() {
        process_name=$1
        command_to_start=$2

        pids=$(pgrep -f "$process_name")
        if [ -n "$pids" ]; then
          kill "$pids"
        fi
        $command_to_start &
      }

      restart_process "hyprpaper" "hyprpaper"
      restart_process "waybar" "waybar"
      systemctl --user restart swaync.service
      systemctl --user restart swayosd.service
      hyprctl reload
    '')
  ];
}
