local o = vim.opt
local g = vim.g

g.netrw_liststyle = 3
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.relativenumber = true
o.rnu = true
o.exrc = true
o.nu = true
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
o.errorbells = false
o.wrap = false
o.hlsearch = false
o.hidden = true
o.swapfile = false
o.backup = false
o.undofile = false
o.incsearch = true
o.scrolloff = 8
o.termguicolors = true
o.updatetime = 50
o.splitbelow = true
o.signcolumn = 'yes'
o.colorcolumn = '80'
o.ai = true
o.cursorline = true
o.cursorcolumn = true
o.shellxquote = ''
o.shellquote = ''

vim.cmd [[
highlight Normal guibg=none
highlight NonText guibg=none
]]

vim.g.mapleader = " "
vim.g.maplocalleader = " "
