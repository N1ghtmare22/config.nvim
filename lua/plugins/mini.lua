return {
	"echasnovski/mini.nvim",
	lazy = false,
	config = function()
		require("mini.surround").setup()
		require("mini.pairs").setup({})
		--require("mini.statusline").setup({
		--	use_icons = vim.g.have_nerd_font,
		--})
	end,
}
