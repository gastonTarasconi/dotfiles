return {
  {
    'savq/melange-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'melange'
    end,
  },

  {
    'morhetz/gruvbox',
    priority = 1000,
  },
}
