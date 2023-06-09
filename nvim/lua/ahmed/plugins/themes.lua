return {
  'navarasu/onedark.nvim',
  'rose-pine/neovim',
  config = function()
    require('rose-pine').setup({
      { 'rose-pine/neovim', name = 'rose-pine' }
    })
  end,
}
