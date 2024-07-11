{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "sidebar.nvim";
      version = "2024-02-07";
      src = pkgs.fetchFromGitHub {
        owner = "sidebar-nvim";
        repo = "sidebar.nvim";
        rev = "5695712eef6288fff667343c4ae77c54911bdb1b";
        sha256 = "1p12189367x0x26cys9wxipzwr3i0bmz4lb0s79ki0a49d6zja2c";
      };
    })
  ];
  extraConfigLua = ''
        local sidebar = require("sidebar-nvim")
        sidebar.setup({
        disable_default_keybindings = 0,
        bindings = nil,
        open = false,
        side = "left",
        initial_width = 32,
        hide_statusline = false,
        update_interval = 1000,
        sections = { "datetime", "files", "git", "buffers", "containers" },
        section_separator = {"", "-----", ""},
        section_title_separator = {""},
        containers = {
            attach_shell = "/bin/sh", show_all = true, interval = 5000,
        },
        datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
        todos = { ignored_paths = {} },
        ["git"] = {
            icon = "", -- 
        },
        files = {
          icon = "",
          show_hidden = true,
          ignored_paths = {"%.git$"}
        },
        buffers = {
          icon = "",
          ignored_buffers = {}, -- ignore buffers by regex
          sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
          show_numbers = true, -- whether to also show the buffer numbers
          ignore_not_loaded = false, -- whether to ignore not loaded buffers
          ignore_terminal = true, -- whether to show terminal buffers in the list
        },
    })
          cmd = {
            "SidebarNvimToggle",
            "SidebarNvimOpen",
            "SidebarNvimFocus",
            "SidebarNvimUpdate",
          },
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":SidebarNvimToggle<CR>";
      options = {
        desc = "Toggle Explorer";
        silent = true;
      };
    }
  ];
}
