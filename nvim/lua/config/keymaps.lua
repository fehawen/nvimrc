vim.keymap.set({ 'n' }, '<Tab>', vim.cmd.noh, { desc = 'Stop hlsearch highlighting' })

-- " Ctrl-C, Ctrl-V option for copy/paste
vim.keymap.set('v', '<C-c>', '"+yi')
vim.keymap.set('v', '<C-x>', '"+c')
vim.keymap.set('v', '<C-v>', 'c<ESC>"+p')
vim.keymap.set('i', '<C-v>', '<ESC>"+pa')

-- Find
vim.keymap.set('n', '<C-f>', ':find<Space>')

-- Popup menu
vim.cmd[[ inoremap <expr><S-TAB> pumvisible() ? "\<Esc>" : "\<C-n>"' ]]

-- Tabs
vim.keymap.set('n', '<C-Left>', ':tabp<CR>')
vim.keymap.set('n', '<C-Right>', ':tabn<CR>')

-- Buffers
vim.keymap.set('n', '<C-h>', ':bN<CR>')
vim.keymap.set('n', '<C-l>', ':bp<CR>')

-- Terminal open and close
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufEnter' }, {
  pattern = { '*' },
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    if vim.opt.buftype:get() == 'terminal' then
      vim.opt.number = false
      vim.cmd(':startinsert')
    end
  end
})

local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local function create_floating_window(opts)
  opts = opts or {}

  -- Default to 80%
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- Center the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Recycle or create a buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  }
  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end


-- Create a terminal window with the default dimensions
vim.api.nvim_create_user_command('Terminal', function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, {})

vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Leave insert mode on terminal' })
vim.keymap.set({ 'n', 't' }, '<leader>t', '<cmd>Terminal<cr>', { desc = 'Open floating terminal' })
