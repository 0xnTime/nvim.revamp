vim.pack.add { { src = "https://github.com/catppuccin/nvim", name = "catppuccin" } }

vim.pack.add({ "https://github.com/reobin/olive-crt.nvim" })

require("olive_crt").setup({
  transparent = false,
})

