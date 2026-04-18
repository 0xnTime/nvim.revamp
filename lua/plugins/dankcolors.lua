return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#232720',
				base01 = '#232720',
				base02 = '#6c6d69',
				base03 = '#6c6d69',
				base04 = '#232321',
				base05 = '#bdbfb9',
				base06 = '#bdbfb9',
				base07 = '#bdbfb9',
				base08 = '#c15841',
				base09 = '#c15841',
				base0A = '#648220',
				base0B = '#208c15',
				base0C = '#768552',
				base0D = '#648220',
				base0E = '#a8b689',
				base0F = '#a8b689',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#6c6d69',
				fg = '#bdbfb9',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#648220',
				fg = '#232720',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#6c6d69' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#768552', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#a8b689',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#648220',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#648220',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#768552',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#208c15',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#232321' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#232321' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#6c6d69',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
