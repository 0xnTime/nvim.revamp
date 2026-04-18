vim.pack.add({ "https://github.com/reobin/olive-crt.nvim" })
vim.cmd.colorscheme("olive-crt")

local olive_crt = require("olive_crt")

olive_crt.setup({
  transparent = true,
})

vim.cmd.colorscheme("olive-crt")

