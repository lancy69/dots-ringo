vim.g.mapleader = " "
vim.g.maplocalleader = ";"

vim.opt.breakindent = true
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 0
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.winborder = "double"

vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.pack.add({{
  name = "tokyonight.nvim",
  src = "https://github.com/folke/tokyonight.nvim",
}})
vim.cmd.colorscheme("tokyonight-storm")
