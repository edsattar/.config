return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
      require('nvim-treesitter.configs').setup {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "html",
          "javascript",
          "json",
          'lua',
          'markdown',
          'python',
          'rust',
          'tsx',
          'typescript',
          'vimdoc',
          'vim'
        },
      }
    end
  }
