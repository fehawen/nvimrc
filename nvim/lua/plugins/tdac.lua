return {
  'rachartier/tiny-devicons-auto-colors.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  event = 'VeryLazy',
  config = function()
    require('tiny-devicons-auto-colors').setup({
      colors = require("catppuccin.palettes").get_palette("macchiato"),
    })
  end
}
