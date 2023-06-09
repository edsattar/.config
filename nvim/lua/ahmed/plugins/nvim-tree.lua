return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  config = function()
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings --
      api.config.mappings.default_on_attach(bufnr)

      -- remove a default
      vim.keymap.del('n', 'g?', { buffer = bufnr })

      -- custom mappings
      vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close'))
    end
    require("nvim-tree").setup({
      on_attach = my_on_attach,
      sort_by = "case_sensitive",
      view = { width = 25, },
      renderer = {
        group_empty = true,
        indent_markers = { enable = true, inline_arrows = false, },
      },
      git = { ignore = false },
    })
  end,
}
