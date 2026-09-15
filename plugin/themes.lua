vim.pack.add{{
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine"
}}
vim.pack.add{{
	src = "https://github.com/craftzdog/solarized-osaka.nvim",
	name = "solarized-osaka"
}}
vim.pack.add{("https://github.com/ellisonleao/gruvbox.nvim")}

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

require("gruvbox").setup({
	  transparent_mode = true
})

vim.cmd.colorscheme("gruvbox")
