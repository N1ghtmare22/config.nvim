local state = {
	floating = {
		buf = -1,
		win = -1,
	},
}

local function create_floating_window(opts)
	opts = opts or {}
	local buf = nil
	if vim.api.nvim_buf_is_valid(opts.buf) then
		buf = opts.buf
	else
		buf = vim.api.nvim_create_buf(false, true)
	end

	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local winconf = {
		relative = "editor",
		row = row,
		col = col,
		width = width,
		height = height,
		style = "minimal",
		border = "rounded",
	}
	local win = vim.api.nvim_open_win(buf, true, winconf)

	return { buf = buf, win = win }
end

vim.api.nvim_create_user_command("Floaterm", function()
	if not vim.api.nvim_win_is_valid(state.floating.win) then
		state.floating = create_floating_window({ buf = state.floating.buf })
		if vim.bo[state.floating.buf].buftype ~= "terminal" then
			-- get os name and change shell
			if require("utils.os").get_os() == "windows" then
				if vim.fn.executable("pwsh") then
					vim.o.shell = "pwsh"
				elseif vim.fn.executable("powershell") then
					vim.o.shell = "powershell"
				else
					vim.o.shell = "cmd"
				end
			else
				vim.cmd.shell = os.getenv("SHELL")
			end
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.floating.win)
	end
end, {})
