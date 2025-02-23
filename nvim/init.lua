vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

require('config/lazy')
require('config/autocmd')
require('config/options')
require('config/keymaps')
