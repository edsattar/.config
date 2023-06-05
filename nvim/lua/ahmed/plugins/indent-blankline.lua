return { 
  "lukas-reineke/indent-blankline.nvim",

  -- See `:help indent-blankline` ┆¦ █ ┃
  config = function()
    require("indent_blankline").setup {
      char = '',
      --context_char = '+',
      show_current_context = true
    }
  end,
}
