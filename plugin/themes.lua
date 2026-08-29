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
	on_highlights = function(hl, c)
		-- hl.Cursor = {
		-- 	fg = c.bg,
		-- 	bg = "#ffffff",
		-- }
		hl.TelescopeNormal = {
			bg = "NONE",
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = "NONE",
			fg = c.fg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = "NONE",
		}
		hl.TelescopePromptBorder = {
			bg = "NONE",
			fg = c.fg_dark,
		}
		hl.TelescopePromptTitle = {
			bg = "NONE",
			fg = c.fg_dark,
		}
		hl.TelescopePreviewTitle = {
			bg = "NONE",
			fg = c.fg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = "NONE",
			fg = c.fg_dark,
		}
		hl.MiniNotifyNormal = {
			bg = "NONE",
		}
		hl.MiniNotifyBorder = {
			bg = "NONE",
		}
	end,
})
