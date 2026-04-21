vim.api.nvim_create_user_command("ThemePicker", function()
	require("themepicker").pick()
end, {})

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		require("themepicker").load()
	end,
})
