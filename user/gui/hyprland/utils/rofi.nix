{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = [pkgs.rofi-wayland];
    file.".config/rofi/config.rasi".text = with config.lib.stylix.colors; ''
       /*****----- Configuration -----*****/
       configuration {
       	modi:                       "drun,run,filebrowser,window";
           show-icons:                 true;
           display-drun:               " Apps";
           display-run:                " Run";
           display-filebrowser:        " Files";
           display-window:             " Windows";
       	drun-display-format:        "{name}";
       	window-format:              "{w} · {c} · {t}";
       }
       * {
         background:     #${base00};
         background-alt: #${base01};
         foreground:     #${base06};
         selected:       #${base0D};
         active:         #${base0A};
         urgent:         #${base08};
         border-colour:               @selected;
         handle-colour:               @selected;
         background-colour:           @background;
         foreground-colour:           @foreground;
         alternate-background:        @background-alt;
         normal-background:           @background;
         normal-foreground:           @foreground;
         urgent-background:           @urgent;
         urgent-foreground:           @background;
         active-background:           @active;
         active-foreground:           @background;
         selected-normal-background:  @selected;
         selected-normal-foreground:  @background;
         selected-urgent-background:  @active;
         selected-urgent-foreground:  @background;
         selected-active-background:  @urgent;
         selected-active-foreground:  @background;
         alternate-normal-background: @background;
         alternate-normal-foreground: @foreground;
         alternate-urgent-background: @urgent;
         alternate-urgent-foreground: @background;
         alternate-active-background: @active;
         alternate-active-foreground: @background;
      }
       window {
           transparency:                "real";
           location:                    center;
           anchor:                      center;
           fullscreen:                  false;
           width:                       800px;
           x-offset:                    0px;
           y-offset:                    0px;

           enabled:                     true;
           margin:                      0px;
           padding:                     0px;
           border:                      0px solid;
           border-radius:               10px;
           border-color:                @border-colour;
           cursor:                      "default";
           background-color:            @background-colour;
       }

       mainbox {
           enabled:                     true;
           spacing:                     0px;
           margin:                      0px;
           padding:                     20px;
           border:                      0px solid;
           border-radius:               0px 0px 0px 0px;
           border-color:                @border-colour;
           background-color:            transparent;
           children:                    [ "inputbar", "message", "mode-switcher", "listview" ];
       }

       inputbar {
           enabled:                     true;
           spacing:                     10px;
           margin:                      0px 0px 10px 0px;
           padding:                     5px 10px;
           border:                      0px solid;
           border-radius:               10px;
           border-color:                @border-colour;
           background-color:            @alternate-background;
           text-color:                  @foreground-colour;
           children:                    [ "textbox-prompt-colon", "entry" ];
       }

       prompt {
           enabled:                     true;
           background-color:            inherit;
           text-color:                  inherit;
       }

       textbox-prompt-colon {
           enabled:                     true;
           padding:                     5px 0px;
           expand:                      false;
           str:                         "";
           background-color:            inherit;
           text-color:                  inherit;
       }

       entry {
           enabled:                     true;
           padding:                     5px 0px;
           background-color:            inherit;
           text-color:                  inherit;
           cursor:                      text;
           placeholder:                 "Search...";
           placeholder-color:           inherit;
       }

       num-filtered-rows {
           enabled:                     true;
           expand:                      false;
           background-color:            inherit;
           text-color:                  inherit;
       }

       textbox-num-sep {
           enabled:                     true;
           expand:                      false;
           str:                         "/";
           background-color:            inherit;
           text-color:                  inherit;
       }

       num-rows {
           enabled:                     true;
           expand:                      false;
           background-color:            inherit;
           text-color:                  inherit;
       }

       case-indicator {
           enabled:                     true;
           background-color:            inherit;
           text-color:                  inherit;
       }

       listview {
           enabled:                     true;
           columns:                     1;
           lines:                       8;
           cycle:                       true;
           dynamic:                     true;
           scrollbar:                   false;
           layout:                      vertical;
           reverse:                     false;
           fixed-height:                true;
           fixed-columns:               true;

           spacing:                     5px;
           margin:                      0px;
           padding:                     10px;
           border:                      0px 2px 2px 2px;
           border-radius:               0px 0px 10px 10px;
           border-color:                @border-colour;
           background-color:            transparent;
           text-color:                  @foreground-colour;
           cursor:                      "default";
       }

       scrollbar {
           handle-width:                5px;
           handle-color:                @handle-colour;
           border-radius:               10px;
           background-color:            @alternate-background;
       }

       element {
           enabled:                     true;
           spacing:                     10px;
           margin:                      0px;
           padding:                     6px;
           border:                      0px solid;
           border-radius:               6px;
           border-color:                @border-colour;
           background-color:            transparent;
           text-color:                  @foreground-colour;
           cursor:                      pointer;
       }

       element normal.normal {
           background-color:            @normal-background;
           text-color:                  @normal-foreground;
       }

       element normal.urgent {
           background-color:            @urgent-background;
           text-color:                  @urgent-foreground;
       }

       element normal.active {
           background-color:            @active-background;
           text-color:                  @active-foreground;
       }

       element selected.normal {
           background-color:            @selected-normal-background;
           text-color:                  @selected-normal-foreground;
       }

       element selected.urgent {
           background-color:            @selected-urgent-background;
           text-color:                  @selected-urgent-foreground;
       }

       element selected.active {
           background-color:            @selected-active-background;
           text-color:                  @selected-active-foreground;
       }

       element alternate.normal {
           background-color:            @alternate-normal-background;
           text-color:                  @alternate-normal-foreground;
       }

       element alternate.urgent {
           background-color:            @alternate-urgent-background;
           text-color:                  @alternate-urgent-foreground;
       }

       element alternate.active {
           background-color:            @alternate-active-background;
           text-color:                  @alternate-active-foreground;
       }

       element-icon {
           background-color:            transparent;
           text-color:                  inherit;
           size:                        24px;
           cursor:                      inherit;
       }

       element-text {
           background-color:            transparent;
           text-color:                  inherit;
           highlight:                   inherit;
           cursor:                      inherit;
           vertical-align:              0.5;
           horizontal-align:            0.0;
       }

       mode-switcher {
           enabled:                     true;
           expand:                      false;
           spacing:                     0px;
           margin:                      0px;
           padding:                     0px;
           border:                      0px solid;
           border-radius:               0px;
           border-color:                @border-colour;
           background-color:            transparent;
           text-color:                  @foreground-colour;
       }

       button {
           padding:                     10px;
           border:                      0px 0px 2px 0px;
           border-radius:               10px 10px 0px 0px;
           border-color:                @border-colour;
           background-color:            @background-colour;
           text-color:                  inherit;
           cursor:                      pointer;
       }

       button selected {
           border:                      2px 2px 0px 2px;
           border-radius:               10px 10px 0px 0px;
           border-color:                @border-colour;
           background-color:            @normal-background;
           text-color:                  @normal-foreground;
       }

       message {
           enabled:                     true;
           margin:                      0px 0px 10px 0px;
           padding:                     0px;
           border:                      0px solid;
           border-radius:               0px 0px 0px 0px;
           border-color:                @border-colour;
           background-color:            transparent;
           text-color:                  @foreground-colour;
       }

       textbox {
           padding:                     10px;
           border:                      0px solid;
           border-radius:               10px;
           border-color:                @border-colour;
           background-color:            @alternate-background;
           text-color:                  @foreground-colour;
           vertical-align:              0.5;
           horizontal-align:            0.0;
       }
    '';
  };
}
