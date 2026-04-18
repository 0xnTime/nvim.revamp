vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })
require('mini.basics').setup()
require('mini.surround').setup()
require('mini.ai').setup()
require('mini.pick').setup()
require('mini.completion').setup()
require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.notify').setup()
require('mini.statusline').setup()
require('mini.move').setup()
require('mini.jump2d').setup({
mappings = {
    start_jumping = 'gw',
  },
})
require('mini.extra').setup()
require('mini.splitjoin').setup()
require('mini.pairs').setup()
