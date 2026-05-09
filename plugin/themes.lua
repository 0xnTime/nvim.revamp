vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

vim.pack.add({ "https://github.com/reobin/olive-crt.nvim" })
vim.pack.add{{
	src = "https://github.com/rose-pine/neovim",
	name = "rose-pine"
}}

vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })

vim.pack.add({ "https://github.com/maxmx03/solarized.nvim" })

require("solarized").setup({
	transparent = {
		enabled = true,
		pmenu = true,
		normal = true,
		normalfloat = true,
		neotree = true,
		nvimtree = true,
		whichkey = true,
		telescope = true,
		lazy = true,
	},

})

require("rose-pine").setup({
	styles = {
		transparency = true
	}
})

require("olive_crt").setup({
  transparent = false,
})

