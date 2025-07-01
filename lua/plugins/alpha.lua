return {
	"goolord/alpha-nvim",
	-- dependencies = { 'echasnovski/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[ ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⠀⡀⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
			[[ ⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣽⠃⠀⠀⠀⢼⠻⣿⣿⣟⣿⣿⣿⣿⣶⣶⣶⣶⣤⣤⣤⣤⣤ ]],
			[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠛⡶⢶⢺⠁⠀⠈⢿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⣿ ]],
			[[ ⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⣤⠀⣀⣠⡛⣣⡀⠀⠈⢿⣿⣿⣻⣏⣿⣿⣿⣿⣿⣿⣟⣿⠿ ]],
			[[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⣳⣶⣿⣿⣷⣾⠱⠀⠀⠊⢿⠿⠿⢛⣽⣿⡿⢿⣿⣟⠿⠿⠿ ]],
			[[ ⠉⠉⠉⠛⠛⠛⠋⠛⠛⠛⣧⠀⡀⠀⠀⢿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠅⢀⢀⡀ ]],
			[[ ⠔⠄⢀⡀⠀⠀⠀⠄⠐⠸⠿⡀⠀⠀⠀⢘⣿⢷⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠰⣠⣇ ]],
			[[ ⣷⣆⣴⣮⢻⡲⡲⠀⠁⠀⠀⠀⠀⠀⠀⠹⡿⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣀⡘⢷⣏ ]],
			[[ ⣿⣿⣿⣗⠿⢈⠁⡀⠀⠁⠀⠀⠀⠀⠀⠀⠉⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⠄⠀⠄⠈⢿⣮⢿ ]],
			[[ ⣿⣟⡿⣾⠀⠀⠀⠀⠀⠀⠀⢀⡤⠄⠀⠀⠀⠀⠸⠁⢠⣦⣤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠈⣿⠀ ]],
			[[ ⣿⣿⠏⠁⢀⡇⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⡏⣷⣵⡻⠃⠄⢴⣆⠀⠀⠀⠀⠀⠀⠀⠰⠀⣆⣷⣿ ]],
			[[ ⣿⡿⣻⠗⠀⢠⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⢠⣤⣄⢰⣶⢯⣤⡈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠆⠀⣿⣼ ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("f", "α  >   Find files", ":Telescope fd<CR>"),
			dashboard.button("n", "Σ  >   Live Grep", ":Telescope live_grep<CR>"),
			dashboard.button("h", "λ  >   Search for help", ":Telescope help_tags<CR>"),
			dashboard.button("r", "Δ  >   Recent", ":Telescope oldfiles<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
