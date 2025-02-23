vim.api.nvim_create_autocmd({'VimEnter'}, {
  pattern = {'*'},
  callback = function(ev)
    vim.cmd[[ if argc() == 0 && !exists('s:std_in') | NvimTreeToggle | endif ]]
  end
})

vim.api.nvim_create_autocmd({'WinEnter', 'BufEnter'}, {
  pattern = {'*'},
  callback = function(ev)
    vim.cmd[[
      let w = '\%81v'
      if &ft == 'python'
        w = '\%73v'
      endif

      call matchadd('ColorColumn', w)
    ]]
  end
})

vim.api.nvim_create_autocmd({'WinLeave', 'BufLeave'}, {
  pattern = {'*'},
  callback = function(ev)
    vim.cmd[[ call clearmatches() ]]
  end
})
