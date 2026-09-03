vim.pack.add{{
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine"
}}
vim.pack.add{{
	src = "https://github.com/craftzdog/solarized-osaka.nvim",
	name = "solarized-osaka"
}}

require("rose-pine").setup({
	styles = {
		transparency = true,
		italic = false,
	},

	highlight_groups = {
		Cursor = { fg = "base", bg = "#ffffff" },
	}
})

require("solarized-osaka").setup({
	transparent = true,
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})

vim.cmd.colorscheme("rose-pine")
