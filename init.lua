require('plugins')
require('settings')
vim.o.guifont="JuliaMono:h10"
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"
vim.cmd "autocmd BufWinEnter * NvimBlamerAuto"
require('language_providers')
require('ayu.colors')
vim.o.background = "dark"
vim.cmd('colorscheme gruvbox')
