return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      transparent_background = false,
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
      },
      no_italic = false,
      no_bold = false,
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          ColorColumn = { fg = colors.base, bg = colors.blue },
        }
      end,
      integrations = { -- https://github.com/catppuccin/nvim#integrations
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        lsp_trouble = true,
        barbar = true,
      },
    })

    vim.cmd('colorscheme catppuccin')
  end
}
