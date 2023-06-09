local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup('ahmed.plugins')
require('ahmed.keymaps')
require('ahmed.options')

vim.cmd.colorscheme("rose-pine-moon")

-- [[ LSP Configuration ]] --
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  'eslint',
  'lua_ls',
  'tsserver',
  'rust_analyzer'
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- [[ Autocomplete Configuration ]] --
-- See `:help nvim-cmp`
local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
  }
})
