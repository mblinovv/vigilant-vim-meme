require("mblinov.config.keymap")

vim.opt.fillchars:append({ eob = " " })

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus") --use system clipboard

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.guicursor = ""
vim.g.zig_fmt_autosave = 0
