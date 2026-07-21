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

-- Keymaps {{{

-- Navigate through wrapped lines like actual lines.
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Highlights become useless when desired patterns are found.
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights." })

-- Replace all instances of the word under cursor.
vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Replace word globally." })

-- Source current buffer, useful for testing configs.
vim.keymap.set("n", "<Leader>s", "<Cmd>source<CR>", { desc = "Source current buffer" })

-- }}}

-- Plugins {{{

vim.pack.add({{
	name = "tokyonight.nvim",
	src = "https://github.com/folke/tokyonight.nvim",
}})
vim.cmd.colorscheme("tokyonight-storm")

vim.pack.add({{
	name = "mini.nvim",
	src = "https://github.com/nvim-mini/mini.nvim",
}})
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

vim.pack.add({{
	name = "oil.nvim",
	src = "https://github.com/stevearc/oil.nvim",
}})
require("oil").setup()
vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory." })

-- }}}
