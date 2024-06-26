-- NOTE: Treesitter configuration
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		opts = {
      disable = { "vimdoc" },
			ensure_installed = { -- Treesitter installed languages
				"vim",
				"lua",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
				"c",
				"markdown",
				"markdown_inline",
				"bash",
				"rust",
				"go",
				"matlab",
				"arduino",
				"fortran",
				"python",
				"java",
				"json",
				"cpp",
				"latex",
				"vala",
				"yaml",
				"dockerfile",
				"nix",
			},
		},
	},
}
