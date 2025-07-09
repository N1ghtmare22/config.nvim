local map = vim.keymap.set

-- windows movement
map("n", "<C-h>", "<C-w>h", { desc = "move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "move to up window" })
map("n", "<C-l>", "<C-w>l", { desc = "move to right window" })
map("n", "<leader>v", "<CMD>vsplit<CR>", { desc = "split window verticaly" })
map("n", "<leader>h", "<CMD>split<CR>", { desc = "split window horizontaly" })
map("n", "<C-o>", "<CMD>tabnext<CR>", { desc = "move to next tab" })
map("n", "<C-i>", "<CMD>tabprevious<CR>", { desc = "move to previous tab" })

-- tabs
map("n", "<leader>r", "<CMD>tabnew<CR>", { desc = "open a new tab" })

-- oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "open oil explorer" })
map("n", "<leader>e", function()
	require("oil").open_float()
end, { desc = "open floating oil explorer" })

--terminal
map("t", "<esc><esc>", "<c-\\><c-n>")
map("n", "<leader>tt", "<CMD>Floaterm<CR>", { desc = "Open floating terminal" })

-- remap caps lock to work as esc
map("n", "<Caps-Lock>", "<esc>")
