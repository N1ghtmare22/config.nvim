local colorscheme = {
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				transparent = true,
				style = { strings = "none" },
				colors = {
					bg = "#000000",
					func = "#bc96b0",
					keyword = "#787bab",
					-- string = "#d4bd98",
					string = "#8a739a",
					-- string = "#f2e6ff",
					-- number = "#f2e6ff",
					-- string = "#d8d5b1",
					number = "#8f729e",
					-- type = "#dcaed7",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
}

return colorscheme
