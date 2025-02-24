vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<cr>', { silent = true, noremap = true })

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true, noremap = true })

    local function custom_mappings(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'p', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', 'S', api.node.open.replace_tree_buffer, opts('Open: In Place'))
      vim.keymap.set('n', 'h', api.node.show_info_popup, opts('Info'))
      vim.keymap.set('n', 'H', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', 'N', api.fs.create, opts('Create File Or Directory'))
      vim.keymap.set('n', 't', api.node.open.vertical, opts('Open: Vertical Split')) -- Unbind 't' from tab
      vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
      vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
      vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'R', api.fs.rename_full, opts('Rename: Full Path'))
      vim.keymap.set('n', '?', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'b', api.marks.toggle, opts('Toggle Bookmark'))
    end

    require('nvim-tree').setup {
      sort = {
        sorter = 'case_sensitive',
      },
      view = {
        width = 40,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      on_attach = custom_mappings,
    }
  end,
}
