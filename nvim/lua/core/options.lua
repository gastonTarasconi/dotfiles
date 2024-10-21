-- [[ Setting options ]]
-- See `:help vim.o`

vim.g.autoformat = false


-- Set highlight on search
vim.o.hlsearch = false
vim.o.incsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 3

-- Tabs & Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.bo.softtabstop = 2

vim.opt.smartindent = true

-- Enable mouse mode
-- vim.o.mouse = 'a'
vim.o.mouse = ''


-- Scroll view
vim.o.scrolloff = 3
vim.o.sidescrolloff = 8

-- Sync clipboard between OS and Neovim.
--vim.o.clipboard = 'unnamedplus'
-- TODO: check
vim.opt.clipboard:append("unnamedplus")

-- Enable break indent
vim.o.breakindent = true

-- Disable wrap
vim.o.wrap = false

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- vim.opt.completeopt = "menu,menuone,noselect,noinsert"

-- Terminal colors
vim.o.termguicolors = true

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 0

vim.opt.colorcolumn = '80'

vim.opt.fileencoding = 'utf-8'

-- Consider - as part of keyword
vim.opt.iskeyword:append("-")

-- TODO: maybe add no swap?

vim.opt.swapfile = false
vim.opt.backup = false

