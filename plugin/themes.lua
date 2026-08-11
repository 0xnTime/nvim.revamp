vim.pack.add{{
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine"
}}

vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

require("rose-pine").setup({
	styles = {
		transparency = true
	}
})

