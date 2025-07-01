local map = vim.keymap.set

-- windows movement
map("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "move to bottom window" })
map("n", "<C-l>", "<C-w>k", { desc = "move to up window" })
map("n", "<C-l>", "<C-w>l", { desc = "move to right window" })
map("n", "<leader>v", "<CMD>vnew<CR>")

-- oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "open oil explorer" })
map("n", "<leader>e", "<CMD>vnew .<CR>", { desc = "open split window with explorer" })
