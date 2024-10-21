-- see the color of an hex #ffffff
return {
  'norcalli/nvim-colorizer.lua',
  event = "VeryLazy",
  config = function()
    -- See `:help telescope` and `:help telescope.setup()`
    require('colorizer').setup {
      'lua',
      'css';
      'javascript';
      html = {
        mode = 'foreground';
      }
    }
  end,
}
