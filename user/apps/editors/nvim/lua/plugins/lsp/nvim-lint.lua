require("lint").linters_by_ft = {
	python = { "ruff" },
}

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
