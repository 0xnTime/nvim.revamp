vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
	require('nvim-treesitter.configs').setup({
		ensure_installed = { 'go', 'c', 'typescript', 'python' },
		auto_install = true,
	})
  end
end })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
