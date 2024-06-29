{ pkgs, userSettings, systemSettings, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        #EnableTrackingProtection = {
        #  Value= true;
        #  Locked = true;
        #  Cryptomining = true;
        #  Fingerprinting = true;
        #};
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        #DisableFirefoxScreenshots = true;
        #OverrideFirstRunPage = "";
        #OverridePostUpdatePage = "";
        #DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
      };
    };
    profiles."${userSettings.username}" = {
      id = 0;
      extensions = with inputs.firefox-addons.packages."${systemSettings.system}"; [
        bitwarden
        proton-vpn
        darkreader
        ff2mpv
      #  # auto-accepts cookies, use only with privacy-badger & ublock-origin
        i-dont-care-about-cookies
        link-cleaner
        privacy-badger
        to-deepl
        ublock-origin
        sidebery
        unpaywall
        vimium
      ];
      settings = {
        "browser.startup.homepage" = "https://homepage.cavestrihome.com";
        "browser.search.region" = "IT";
        "browser.search.isUS" = false;
        "distribution.searchplugins.defaultLocale" = "it-IT";
        "general.useragent.locale" = "it-IT";
        "extensions.autoDisableScopes" = 0;
        "browser.bookmarks.showMobileBookmarks" = true;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.webrender.all" = true;
        "gfx.webrender.enabled" = true;
        "layout.css.backdrop-filter.enabled" = true;
        "svg.context-properties.content.enabled" = true;
        "widget.gtk.ignore-bogus-leave-notify" = 1;
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";
        "browser.newtabpage.pinned" = [{
          title = "NixOS";
          url = "https://nixos.org";
        }];
      }; 
      search = {
        force = true;
        default = "DuckDuckGo";
        order = [ "DuckDuckGo" "Google" ];
      };
      userChrome = ''
        /*Reference https://www.userchrome.org/*/

        /* Hidden state: Fix z-index of active pinned tabs */
        #main-window[titlepreface*="@"] #tabbrowser-tabs { z-index: 0 !important; }

        /* remove the sidebar header entirely */
        #sidebar-header {
          /* display: none; */
          visibility: collapse !important;
        }

        /* Hide vertical sidebar splitter */
        #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] + #sidebar-splitter {
          display: none !important;
        }
        /* Shrink sidebar until hovered */
        :root {
          --thin-tab-width: 31px;
          --wide-tab-width: 300px;
        }
        #sidebar-box:not([sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]) {
          min-width: var(--wide-tab-width) !important;
          max-width: none !important;
        }
        #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] {
          overflow: hidden !important;
          position: relative !important;
          transition: all 300ms !important;
          /*transition: all 0ms 0s !important;*/
          min-width: var(--thin-tab-width) !important;
          max-width: var(--thin-tab-width) !important;
          z-index: 2;
        }
        #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:focus,
        #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:hover,
        #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"] #sidebar {
          /*transition-delay: 0s !important;*/
          transition: all 300ms !important;
          min-width: var(--wide-tab-width) !important;
          max-width: var(--wide-tab-width) !important;
          z-index: 1;
        }
        #sidebar-box[sidebarcommand="_3c078156-979c-498b-8990-85f7987dd929_-sidebar-action"]:hover {
          margin-right: calc((var(--wide-tab-width) - var(--thin-tab-width)) * -1) !important;
        }

        /* Hide title bar but keep window controls (minimize, maximize, close) */
        /*Hide tabs and other things inside the titlebar, except window buttons*/
        /* IFF you like it extreme, change all #main-window[titlepreface*="@"] to #main-window[titlepreface*="@"] */
        /* on VIM it's as simple as %s/[titlepreface\*="@"\] and */
        /* undo with %s/#main-window[titlepreface*="@"]/#main-window[titlepreface*="@"][titlepreface\*="@"\]/g */
        #main-window[titlepreface*="@"] .tabbrowser-tab{  display: none !important; }
        #main-window[titlepreface*="@"] .scrollbox-clip{  width: 0 !important; }
        #main-window[titlepreface*="@"] #alltabs-button{  display: none !important; }
        #main-window[titlepreface*="@"] .toolbar-items{  display: none !important; }
        /*Make sure that the titlebar and navbar are both on the same line*/
        #main-window[titlepreface*="@"] #navigator-toolbox{  display: flex !important; box-sizing: border-box; justify-content:space-between; flex-direction: row-reverse;   flex-wrap: wrap; }
        #main-window[titlepreface*="@"] .titlebar-spacer{  display: none !important; }
        #main-window[titlepreface*="@"] #nav-bar{border-radius: 5px 0 0 0; display: flex; box-sizing: border-box; padding-top: 2px; align-items: center; flex: 1; flex-basis: 50%; width: 100% !important; }
        /* on GNOME you can use max-width: 48px below, if you only have the "Close" button on windows (default) */
        #main-window[titlepreface*="@"] #titlebar{border-radius: 0 5px 0 0; border-left: none !important; margin-top: 1px; flex: 1; flex-basis: 50%; width:10% !important; display: flex; max-width: 100px;   align-items: center;background-color: var(--toolbar-bgcolor) !important; border-left: 1px solid var(--toolbar-color);}
        #main-window[titlepreface*="@"] #titlebar:-moz-window-inactive{opacity: 1 !important;}
        #main-window[titlepreface*="@"] #TabsToolbar > *:not(.titlebar-buttonbox-container) {display: none !important;}
        /* non-conditional css */
        #PersonalToolbar {width: 100% !important; }
        #tab-notification-deck {width: 100% !important;   flex-basis: 100%; width: 100% !important;}
      '';
    };
  };
}
