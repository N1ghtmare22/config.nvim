return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	priority = 1000,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Paleta de cores inspirada no vague.nvim
		local colors = {
			bg = "#000000",
			fg = "#c0caf5",
			keyword = "#7dcfff",
			plus = "#9ece6a",
			func = "#bb9af7",
			string = "#e0af68",
			operator = "#7aa2f7",
			constant = "#ff9e64",
			error = "#f7768e",
			hint = "#2ac3de",
			warning = "#e0af68",
			parameter = "#9d7cd8",
		}

		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		-- Indicador de modo: só a cor muda
		ins_left({
			function()
				return "▊"
			end,
			color = function()
				local mode_color = {
					n = colors.error,
					i = colors.plus,
					v = colors.func,
					[""] = colors.string,
					V = colors.operator,
					c = colors.constant,
					no = colors.keyword,
					s = colors.string,
					S = colors.string,
					[""] = colors.string,
					ic = colors.plus,
					R = colors.error,
					Rv = colors.error,
					cv = colors.constant,
					ce = colors.constant,
					r = colors.hint,
					rm = colors.hint,
					["r?"] = colors.hint,
					["!"] = colors.warning,
					t = colors.parameter,
				}
				return { fg = mode_color[vim.fn.mode()] }
			end,
			padding = { right = 1 },
		})

		-- Tamanho do arquivo
		ins_left({
			"filesize",
			cond = conditions.buffer_not_empty,
		})

		-- Nome do arquivo
		ins_left({
			"filename",
			cond = conditions.buffer_not_empty,
			color = { fg = colors.func, gui = "bold" },
		})

		ins_left({ "location" })
		ins_left({ "progress", color = { fg = colors.fg, gui = "bold" } })

		-- Diagnósticos LSP
		ins_left({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " " },
			diagnostics_color = {
				error = { fg = colors.error },
				warn = { fg = colors.warning },
				info = { fg = colors.hint },
			},
		})

		-- Centralizador
		ins_left({
			function()
				return "%="
			end,
		})

		-- Nome do LSP ativo
		ins_left({
			function()
				local msg = "No Active Lsp"
				local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
				local clients = vim.lsp.get_clients()
				if next(clients) == nil then
					return msg
				end
				for _, client in ipairs(clients) do
					local filetypes = client.config.filetypes
					if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						return client.name
					end
				end
				return msg
			end,
			icon = " LSP:",
			color = { fg = colors.fg, gui = "bold" },
		})

		-- Encoding
		ins_right({
			"o:encoding",
			fmt = string.upper,
			cond = conditions.hide_in_width,
			color = { fg = colors.plus, gui = "bold" },
		})

		-- Formato do arquivo
		ins_right({
			"fileformat",
			fmt = string.upper,
			icons_enabled = false,
			color = { fg = colors.plus, gui = "bold" },
		})

		-- Branch Git
		ins_right({
			"branch",
			icon = "",
			color = { fg = colors.operator, gui = "bold" },
		})

		-- Diff Git
		ins_right({
			"diff",
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = colors.plus },
				modified = { fg = colors.warning },
				removed = { fg = colors.error },
			},
			cond = conditions.hide_in_width,
		})

		lualine.setup(config)
	end,
}
