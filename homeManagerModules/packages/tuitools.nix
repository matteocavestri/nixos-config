{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages = {
      atac.enable = lib.mkEnableOption "Install atac";
      sshs.enable = lib.mkEnableOption "Install sshs";
      termshark.enable = lib.mkEnableOption "Install termshark";
      lf.enable = lib.mkEnableOption "Install lf";
    };
  };
  config = {
    # Install atac (API tool)
    home.packages = with pkgs;
      lib.optionals config.user.packages.atac.enable [
        atac
      ]
      # Install sshs (ssh tool)
      ++ (lib.optionals config.user.packages.sshs.enable [
        sshs
      ])
      # Install termshark (security tool)
      ++ (lib.optionals config.user.packages.termshark.enable [
        termshark
      ]);

    # Install and configure lf
    programs.lf = lib.mkIf config.user.packages.lf.enable {
      enable = true;
      commands = {
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
        editor-open = ''$$EDITOR $f'';
        mkdir = ''
          ''${{
            printf "Directory Name: "
            read DIR
            mkdir $DIR
          }}
        '';
      };

      # Lf keybindings
      keybindings = {
        "\\\"" = "";
        o = "";
        c = "mkdir";
        "." = "set hidden!";
        "`" = "mark-load";
        "\\'" = "mark-load";
        "<enter>" = "open";
        do = "dragon-out";
        "g~" = "cd";
        gh = "cd";
        "g/" = "/";
        ee = "editor-open";
        V = ''''$${pkgs.bat}/bin/bat --paging=always "$f"'';
      };

      # Lf settings
      settings = {
        preview = true;
        hidden = true;
        drawbox = true;
        icons = true;
        ignorecase = true;
      };

      # Lf extraConfig for scripts
      extraConfig = let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5

          if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          fi

          ${pkgs.pistol}/bin/pistol "$file"
        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
    };

    # Lf icons configuration
    xdg = lib.mkIf config.user.packages.lf.enable {
      configFile."lf/icons".source = ./common/icons;
    };
  };
}
