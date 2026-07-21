-- =============================================================================
-- SECTION 1: Basics
-- Core settings, globals and options.
-- =============================================================================

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

-- =============================================================================
-- SECTION 2: Keymaps
-- General keymaps that make life easier. Plugins should set their own keymaps.
-- =============================================================================

-- Navigate through wrapped lines like actual lines.
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Highlights become useless when desired patterns are found.
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Clear highlights." })

-- Delete inactive plugins. Disk space matter.
vim.keymap.set("n", "<Leader>dp", function()
	vim.pack.del(vim.iter(vim.pack.get())
		:filter(function(x) return not x.active end)
		:map(function(x) return x.spec.name end)
		:totable()
	)
end, {
	desc = "Delete inactive plugins.",
})

-- Replace all instances of the word under cursor.
vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Replace word globally." })

-- Source current buffer, useful for testing configs.
vim.keymap.set("n", "<Leader>s", "<Cmd>source<CR>", { desc = "Source current buffer." })

-- Delete current buffer.
vim.keymap.set("n", "<Leader>x", "<Cmd>bdelete<CR>", { desc = "Delete current buffer." })

-- =============================================================================
-- SECTION 3: Plugins
-- This is where the NeoVim magic starts.
-- =============================================================================

-- tokyonight.nvim
-- A clean, dark colorscheme, source of asthetics.
vim.pack.add({{
	name = "tokyonight.nvim",
	src = "https://github.com/folke/tokyonight.nvim",
}})
require("tokyonight").setup({
	on_highlights = function(hl, c)
		hl.BufferLineIndicatorSelected = {
			bg = c.bg,
			fg = c.git.change,
		}
	end
})
vim.cmd.colorscheme("tokyonight-storm")

-- mini.nvim
-- A collection of small, focused modules.
vim.pack.add({{
	name = "mini.nvim",
	src = "https://github.com/nvim-mini/mini.nvim",
}})
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- bufferline.nvim
-- Most popular and mature tabline for NeoVim.
vim.pack.add({{
	name = "bufferline.nvim",
	src = "https://github.com/akinsho/bufferline.nvim",
}})
require("bufferline").setup({})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<Leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<Leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<Leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<Leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<Leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<Leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<Leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<Leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", opts)
vim.keymap.set("n", "<Leader>0", "<Cmd>BufferLineGoToBuffer -1<CR>", opts)

-- lualine.nvim
-- A blazing fast and easy to configure Neovim statusline.
vim.pack.add({{
	name = "lualine.nvim",
	src = "https://github.com/nvim-lualine/lualine.nvim",
}})

require("lualine").setup({
	options = {
		component_separators = { left = " ", right = " " },
		secton_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = "" } } },
		lualine_b = { { "branch", "diff", "diagnostics", separator = { right = "" } } },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { { "progress", separator = { left = "" } } },
		lualine_z = { { "location", separator = { left = "", right = "" } } },
	},
})

-- gitsigns.nvim
-- Shows Git changes in the sign column and provides Git-aware actions.
vim.pack.add({{
	name = "gitsigns.nvim",
	src = "https://github.com/lewis6991/gitsigns.nvim",
}})
require("gitsigns").setup()

-- guess-indent.nvim
-- Automatically detects indentation settings for each buffer.
vim.pack.add({{
	name = "guess-indent.nvim",
	src = "https://github.com/nmac427/guess-indent.nvim",
}})
require("guess-indent").setup()

-- todo-comments.nvim
-- Highlights and searches TODO-style annotations in comments.
vim.pack.add({{
	name = "todo-comments.nvim",
	src = "https://github.com/folke/todo-comments.nvim",
}})
require("todo-comments").setup({ signs = false })

-- oil.nvim
-- A file explorer that lets directories be edited like normal buffers.
vim.pack.add({{
	name = "oil.nvim",
	src = "https://github.com/stevearc/oil.nvim",
}})
require("oil").setup()
vim.keymap.set("n", "-", "<Cmd>Oil<CR>", { desc = "Open parent directory." })

-- telescope.nvim
-- A highly extensible fuzzy finder for files, text, and more.
local telescope_plugins = {{
	name = "plenary.nvim",
	src = "https://github.com/nvim-lua/plenary.nvim",
}, {
	name = "telescope.nvim",
	src = "https://github.com/nvim-telescope/telescope.nvim",
}}

if vim.fn.executable("make") == 1 then
	table.insert(telescope_plugins, {
		name = "telescope-fzf-native.nvim",
		src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
	})
	vim.api.nvim_create_autocmd("PackChanged", {
		group = vim.api.nvim_create_augroup("plugins-build", { clear = false }),
		callback = function(ev)
			local name = ev.data.spec.name
			local kind = ev.data.kind
			if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
				local result = vim.system({ "make" }, { cwd = ev.data.path }):wait()
				if result.code ~= 0 then
					local stdout = result.stdout or ""
					local stderr = result.stderr or ""
					local note = stderr ~= "" and stderr or stdout
					vim.notify("Build failed for telescope-fzf-native.nvim:\n" .. note, vim.log.levels.ERROR)
				else
					vim.notify("Build succeeded for telescope-fzf-native.nvim.")
				end
			end
		end,
	})
end

vim.pack.add(telescope_plugins)
require("telescope").setup()

local tb = require("telescope.builtin")
vim.keymap.set("n", "<Leader>fb", tb.buffers, { desc = "Find buffers." })
vim.keymap.set("n", "<Leader>fd", tb.buffers, { desc = "Find diagnostics." })
vim.keymap.set("n", "<Leader>ff", tb.find_files, { desc = "Find files." })
vim.keymap.set("n", "<Leader>fg", tb.live_grep, { desc = "Find patterns." })
vim.keymap.set("n", "<Leader>fh", tb.help_tags, { desc = "Find help text." })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("telescope-lsp-attach", {}),
	callback = function(ev)
		vim.keymap.set("n", "<Leader>ld", tb.lsp_definitions, { buffer = ev.buf, desc = "Find LSP definitions." })
		vim.keymap.set("n", "<Leader>lr", tb.lsp_references, { buffer = ev.buf, desc = "Find LSP references." })
	end,
})
