return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 25,
      },
      renderer = {
        group_empty = true,
        indent_markers = {
          enable = true,
          inline_arrows = false,
        },
      },
      git = {
        ignore = false
      }
    })
  end,
}
