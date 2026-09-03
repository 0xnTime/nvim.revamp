vim.pack.add({"https://github.com/tpope/vim-fugitive"})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>p", function()
	vim.cmd.Git('push')
end)

-- rebase always
vim.keymap.set("n", "<leader>P", function()
	vim.cmd.Git('pull --rebase')
end)

vim.keymap.set("n", "<leader>t", ":Git push -u origin ");

vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
