vim.pack.add{{
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine"
}}

vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

vim.pack.add({ "https://github.com/WTFox/jellybeans.nvim" })

require("rose-pine").setup({
	styles = {
		transparency = true
	},
	
	highlight_groups = {
		Cursor = { fg = "base", bg = "#ffffff" },
	}
})
