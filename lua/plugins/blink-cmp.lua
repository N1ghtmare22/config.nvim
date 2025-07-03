return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			config = function()
				--local luasnip = require 'luasnip'

				--luasnip.add_snippets("c", require("snippets.c"))
				require("luasnip.loaders.from_lua").load({ paths = "~/AppData/Local/nvim/lua/snippets/" })
			end,
		},
		"folke/lazydev.nvim",
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		snippets = { preset = "luasnip" },
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 0 },
			ghost_text = { enabled = true },

			menu = {
				draw = {
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind", gap = 1 },
						{ "label_description", gap = 1 },
						{ "source_name", gap = 1 },
					},
				},
			},
		},

		signature = {
			enabled = true,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
	opts_extend = { "sources.default" },
}
