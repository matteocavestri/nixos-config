local home = os.getenv "HOME"

return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    version = "^1",
    lazy = "true",
    cmd = {
      "CodeSnap",
      "CodeSnapSave",
    },
    config = function()
      require("codesnap").setup {
        title = "CodeSnap.nvim",
        code_font_family = "JetBrainsMono Nerd Font",
        mac_window_bar = false,
        has_breadcrumbs = true,
        bg_theme = "default",
        save_path = home .. "/snap.png",
        watermark_font_family = "Pacifico",
        watermark = "Matteo Cavestri",
      }
    end,
  },
}
