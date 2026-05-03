vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.cmdheight = 0

vim.o.mouse = "a"

-- tab options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.softtabstop = 2

vim.o.scrolloff = 10
vim.o.signcolumn = "yes"

vim.o.confirm = true
vim.o.confirm = true
vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false

vim.o.showmode = false
vim.cursorline = true

vim.opt.termguicolors = true
vim.o.guicursor = "i-ci-sm:block"

-- disable if you're on linux/macos
vim.o.shell = "pwsh"

vim.o.shellcmdflag = "-NoLogo"

-- sync the system clipboard with neovim
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.updatetime = 50
