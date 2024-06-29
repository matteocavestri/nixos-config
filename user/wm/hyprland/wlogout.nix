{ pkgs, config, lib,  ... }:

{
  programs.wlogout = { 
    enable = true;
    package = pkgs.wlogout;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "        ";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        #text = "Logout";
        text = "        ";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        #text = "Shutdown";
        text = "        ";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        #text = "Reboot";
        text = "        ";
        keybind = "r";
      }
    ];
    style = ''
      * {
	      background-image: none;
      }

      window {
        /*
        background: rgba('' + config.lib.stylix.colors.base00-rgb-r + "," + config.lib.stylix.colors.base00-rgb-g + "," + config.lib.stylix.colors.base00-rgb-b + "," + ''0.55); */
        background: transparent
      }
  
      button {
        color: #'' + config.lib.stylix.colors.base0A + '';
        background: rgba('' + config.lib.stylix.colors.base00-rgb-r + "," + config.lib.stylix.colors.base00-rgb-g + "," + config.lib.stylix.colors.base00-rgb-b + "," + ''0.8);
      	border-style: solid;
        border-width: 3px;
        border-color: #'' + config.lib.stylix.colors.base02 + '';
	      background-repeat: no-repeat;
	      background-position: center;
	      background-size: 35%;
	      border-radius:30px;
        margin: 20px 20px;
      }

      button:focus, button:active, button:hover {
	      background-color: #'' + config.lib.stylix.colors.base09 + '';
        border-style: solid;
        border-width: 3px;
        border-color: #'' + config.lib.stylix.colors.base0A + '';
	      outline-style: solid;
        outline-color: #'' + config.lib.stylix.colors.base0A + '';
        outline-width: 3px;
      }

      #logout {
        background-image: url("'' + ../../style/arrow-right-from-bracket-solid.svg + ''");
      }

      #shutdown {
        background-image: url("'' + ../../style/power-off-solid.svg + ''");
      }

      #reboot {
        background-image: url("'' + ../../style/rotate-right-solid.svg + ''");
      }

      #lock {
        background-image: url("'' + ../../style/lock-solid.svg + ''");
      }
    '';
  };
}
