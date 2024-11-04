{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    user.packages.shell = {
      ohmyposh.enable = lib.mkEnableOption "Enable ohmyposh and customizations";
    };
  };

  config = lib.mkIf config.user.packages.shell.ohmyposh.enable {
    # Oh My posh package
    home = {
      packages = with pkgs; [
        oh-my-posh
      ];

      # Oh my posh customizations
      file.".config/ohmyposh/config.toml".text = ''
        #:schema https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json

        version = 2
        final_space = true
        console_title_template = '{{ .Shell }} in {{ .Folder }}'

        [[blocks]]
          type = 'prompt'
          alignment = 'left'
          newline = true

          [[blocks.segments]]
            type = 'path'
            style = 'plain'
            background = 'transparent'
            foreground = 'blue'
            template = '{{ .Path }}'

            [blocks.segments.properties]
              style = 'full'

          [[blocks.segments]]
            type = 'git'
            style = 'plain'
            foreground = 'p:grey'
            background = 'transparent'
            template = ' {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>'

            [blocks.segments.properties]
              branch_icon = ' '
              commit_icon = '@'
              fetch_status = true

        [[blocks]]
          type = 'rprompt'
          overflow = 'hidden'

          [[blocks.segments]]
            type = 'executiontime'
            style = 'plain'
            foreground = 'yellow'
            background = 'transparent'
            template = '{{ .FormattedMs }}'

            [blocks.segments.properties]
              threshold = 5000

        [[blocks]]
          type = 'prompt'
          alignment = 'left'
          newline = true

          [[blocks.segments]]
            type = 'text'
            style = 'plain'
            foreground_templates = [
              "{{if gt .Code 0}}red{{end}}",
              "{{if eq .Code 0}}magenta{{end}}",
            ]
            background = 'transparent'
            template = '❯'

        [transient_prompt]
          foreground_templates = [
            "{{if gt .Code 0}}red{{end}}",
            "{{if eq .Code 0}}magenta{{end}}",
          ]
          background = 'transparent'
          template = '❯ '

        [secondary_prompt]
          foreground = 'magenta'
          background = 'transparent'
          template = '❯❯ '

      '';
    };
  };
}
