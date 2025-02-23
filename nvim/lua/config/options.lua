vim.g.have_nerd_font = true

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = false
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = false

vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true

vim.opt.list = true
vim.opt.listchars = 'tab:⋮ ,trail:·'
vim.opt.fillchars = 'vert:│,fold:┄,diff:╱'
vim.opt.showbreak = '↪'

vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.sidescrolloff = 8 -- Minimal number of screen columns to keep left and right of the cursor.

vim.opt.path = vim.opt.path + '**'

vim.opt.showcmd = false
vim.opt.autoread = true -- auto load file changes occured outside vim

vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1 -- Negative to use shiftwidth value
vim.opt.expandtab = true
vim.opt.tabstop = 8 -- Do not change
vim.opt.shiftwidth = 4
vim.opt.shiftround = true -- round indent to sw compatible
vim.opt.autoindent = true
vim.opt.wrap = false -- using wrapping-paper to show it in virtual text.
vim.opt.textwidth = 80

vim.opt.pumheight = 10

vim.opt.hidden = false -- Require file write

-- Go
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_generate_tags = 1
