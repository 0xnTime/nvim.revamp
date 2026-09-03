local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap.set('n', 'gK', function()

  local new_config = not vim.diagnostic.config().virtual_lines

  vim.diagnostic.config({ virtual_lines = new_config })

end, { desc = 'Toggle diagnostic virtual_lines' })

keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")

-- greatest remap ever
keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

keymap.set("n", "<C-c>", "gcc", { remap = true, desc = "Toggle comment line" })
keymap.set("x", "<C-c>", "gc", { remap = true, desc = "Toggle comment" })


keymap.set("n", "<C-n>", function()
  vim.diagnostic.get_next()
end)

-- Spliting

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "=ap", "ma=ap'a")

keymap.set({ "n", "v" }, "<leader>d", '"_d')

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
