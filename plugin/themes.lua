vim.pack.add{{
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine"
}}

vim.pack.add({ "https://github.com/diegoulloao/neofusion.nvim" })

require("rose-pine").setup({
	styles = {
		transparency = true
	},

	highlight_groups = {
		Cursor = { fg = "base", bg = "#ffffff" },
	}
})

require('neofusion').setup {
	  transparent_mode = true,
}
