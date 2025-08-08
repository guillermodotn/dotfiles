require("intro")
require("pm_lazy")
require("completion_config")
require("ff_telescope")

-- Set leader key
vim.g.mapleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Mouse support
vim.opt.mouse = "a"

-- Clipboard integration
vim.opt.clipboard = "unnamedplus"

-- Keybindings example: jj to escape insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- Set cursor column & line
vim.opt.cursorcolumn = true
vim.opt.cursorline = true

-- LSPs
vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rpmspec')

