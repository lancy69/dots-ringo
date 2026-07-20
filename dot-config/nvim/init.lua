-- Basics {{{

-- Experimental. Load modules faster.
vim.loader.enable()

-- Use different leader keys.
-- NOTE: Set before loading plugins for them to use correct leader keys.
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- Yes, I use NeoVim with a mouse!
-- I betrayed the sacred Vim cult, and should be banished to the VSCode hell.
vim.opt.mouse = "a"

-- Enable relative line numbers for better navigation.
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep a margin when scrolling.
vim.opt.scrolloff = 10

-- Tell me where I am by drawing a cursorline.
vim.opt.cursorline = true

-- Use a sane value for indentations.
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Visually indent wrapped lines.
vim.opt.breakindent = true

-- Enable undo/redo changes even after closing and reopening a file.
vim.opt.undofile = true

-- Make searches case-insensitive UNLESS patterns contain capital letters.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Split new panes to down/right instead of up/left.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Always draw signcolumn to prevent inconsistent padding for sign/nosign.
vim.opt.signcolumn = "yes"

-- Ask the user for actions instead of throwing an error.
vim.opt.confirm = true

-- Draw borders to indicate floating windows.
vim.opt.winborder = "rounded"

-- Fold by markers. Split large file into smaller sections (like this one).
vim.opt.foldmethod = "marker"

-- }}}

-- Plugins {{{

-- Colorscheme
vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
vim.cmd.colorscheme("tokyonight-storm")

-- File Explorer
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require("oil").setup()
vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory." })

-- }}}
