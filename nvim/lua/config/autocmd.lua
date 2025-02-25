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

-- Format code and organize imports on save
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = {'source.organizeImports'} }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})
