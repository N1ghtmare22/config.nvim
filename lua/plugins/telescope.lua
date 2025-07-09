return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},

	opts = function()
		local telescope = require("telescope.builtin")
		local map = vim.keymap.set

		require("telescope").load_extension("fzf")

		map("n", "<leader>sf", telescope.find_files, { desc = "Search Files" })
		map("n", "<leader>sg", telescope.live_grep, { desc = "Live grep" })
		map("n", "<leader>sh", telescope.help_tags, { desc = "Search help" })
		map("n", "<leader>sb", telescope.buffers, { desc = "Search Buffers" })
		map("n", "<leader>sw", telescope.grep_string, { desc = "Seach words" })

		map("n", "<leader>ss", function()
			telescope.live_grep({
				grep_open_files = true,
				prompt_title = "live grep in open files",
			})
		end, { desc = "Live grep in open files" })

		map("n", "<leader>sn", function()
			telescope.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Search config files" })
	end,
}
