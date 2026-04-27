vim.pack.add({ 'https://github.com/folke/snacks.nvim' })


require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = {
		enabled =  false,
	},
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	picker = { enabled = false },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = false },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})

