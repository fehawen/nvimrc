vim.api.nvim_create_autocmd({'VimEnter'}, {
  pattern = {'*'},
  callback = function(ev)
    vim.cmd[[ if argc() == 0 && !exists('s:std_in') | NvimTreeToggle | endif ]]
  end
})

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
  pattern = {'*'},
  callback = function(ev)
    if vim.g.highlight_column ~= nil then
      vim.fn.matchadd('ColorColumn', '\\%' .. vim.g.highlight_column .. 'v', 100)
    end
  end
})

vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
  pattern = {'*'},
  callback = function(ev)
    if vim.g.highlight_column ~= nil then
      vim.fn.clearmatches()
      vim.g.highlight_column = vim.g.highlight_column_default
    end
  end
})
