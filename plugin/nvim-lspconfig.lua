vim.lsp.enable({ 'lua_ls' })
vim.lsp.enable({ 'ts_ls' })
vim.lsp.enable({ 'clangd' })

vim.lsp.config('ts_ls', {
	init_options = {
		tsserver = { path = '/usr/lib/node_modules/typescript/lib/tsserver.js' },
	},
})


vim.api.nvim_create_autocmd('LspAttach', {

	callback = function(ev)

		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		if client:supports_method('textDocument/completion') then

			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end

			client.server_capabilities.completionProvider.triggerCharacters = chars


			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})

		end

	end,

})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
	callback = function(ev)
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
		end


		map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "LSP: Go to declaration")
		map("n", "gi", vim.lsp.buf.implementation, "LSP: Go to implementation")
		map("n", "gr", vim.lsp.buf.references, "LSP: References")
		map("n", "gy", vim.lsp.buf.type_definition, "LSP: Go to type definition")
		map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
		map({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, "LSP: Signature help")
		map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
		map("n", "<leader>fm", function() vim.lsp.buf.format({ async = true }) end, "LSP: Format buffer")

		map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev diagnostic")
		map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
		map("n", "<leader>dl", vim.diagnostic.open_float, "Diagnostic float")
		map("n", "<leader>dq", vim.diagnostic.setloclist, "Diagnostic loclist")
	end,

})

vim.keymap.set('n', 'gK', function()

  local new_config = not vim.diagnostic.config().virtual_lines

  vim.diagnostic.config({ virtual_lines = new_config })

end, { desc = 'Toggle diagnostic virtual_lines' })

vim.keymap.set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
end)
