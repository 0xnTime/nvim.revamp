vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
require('mini.surround').setup()
require('mini.ai').setup()
require('mini.pick').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.jump2d').setup({
mappings = {
    start_jumping = 'gw',
  },
})
