-- https://neovim.io/doc/user/lua-guide.html#lua-guide-mappings
local bind = vim.keymap.set

local es = { noremap = true, expr = true, silent = true }
local tl = require('telescope.builtin')

-- Keymaps for telescope search
bind('n', '<C-p>', function() if not pcall(tl.git_files) then tl.find_files() end end)
bind('n', '<Leader>ff', tl.find_files, {})
bind('n', '<Leader>fs', function() tl.grep_string({ search = vim.fn.input("  ") }) end)
bind('n', '<Leader>fw', function() tl.grep_string({ search = vim.fn.expand("<cword>") }) end,
  { noremap = true, silent = true })
bind('n', '<Leader>fg', tl.live_grep, {})
bind('n', '<Leader>fb', tl.buffers, {})
-- open file explorer
bind('n', '<Leader>e', vim.cmd.NvimTreeToggle)
-- toggle undo tree
bind('n', '<Leader>u', vim.cmd.UndotreeToggle)
-- buffer navigation
bind('n', '<Leader>bn', '<cmd>bn<cr>')
bind('n', '<Leader>bp', '<cmd>bp<cr>')
bind('n', '<Leader>bd', '<cmd>bd<cr>')
-- yank to system clipboard
bind('n', '<Leader>y', '\"+y')
bind('n', '<Leader>Y', '\"+Y')
bind('v', '<Leader>y', '\"+y')
-- search-replace word under cursor
bind('n', '<Leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- navigate between windows/buffers
bind('n', '<C-h>', '<C-w>h')
bind('n', '<C-l>', '<C-w>l')
bind('n', '<C-j>', '<C-w>j')
bind('n', '<C-k>', '<C-w>k')
-- resize windows
bind('n', '<C-Right>', ':vertical res +1^M<CR>')
bind('n', '<C-Left>', ':vertical res -1^M<CR>')
-- save/quit
bind('n', '<C-s>', '<cmd>w<CR>')
bind('i', '<C-s>', '<Esc><cmd>w<CR>a')
bind('n', '<C-q>', '<cmd>q<cr>')
-- comment
bind('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)')
bind('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)')
bind('i', '<C-_>', '<Esc><Plug>(comment_toggle_linewise_current)a')
bind('n', '<A-/>', '<Plug>(comment_toggle_blockwise_current)')
bind('x', '<A-/>', '<Plug>(comment_toggle_blockwise_visual)')
bind('i', '<A-/>', '<Esc><Plug>(comment_toggle_blockwise_current)a')
-- Shift line up or down
bind('n', '<A-j>', '<cmd>m+1<cr>')
bind('n', '<A-k>', '<cmd>m-2<cr>')
bind('v', '<A-j>', ":m'>+1<cr>gv=gv")
bind('v', '<A-k>', ":m'<-2<cr>gv=gv")
-- copy line up or down
bind('n', '<A-J>', 'Yp')
bind('n', '<A-K>', 'YP')
-- better J keep cursor in the spot
bind('n', '<A-h>', 'mzJ`z')
bind('n', '<A-l>', 'mzJ`z')
-- Navigate through wrapped lines
bind('n', 'k', "v:count == 0 ? 'gk' : 'k'", es)
bind('n', 'j', "v:count == 0 ? 'gj' : 'j'", es)
-- Indent with Shift
bind('n', '<S-Tab>', 'v<')
bind('n', '<Tab>', 'v>')
-- Navigation improvements
bind('n', 'H', '^')
bind('n', 'L', '$')
bind('n', 'J', '<C-d>')
bind('n', 'K', '<C-u>')
bind('n', 'n', 'nzzzv')
bind('n', 'N', 'Nzzzv')
-- Don't copy the replaced text after pasting in visual mode
bind('v', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>')
-- Clear highlights
bind('n', '<Esc>', ':noh <cr>')

function RunPython()
  local file_dir = vim.fn.expand('%:p:h')
  local curr_dir = vim.fn.getcwd()
  local file_name = vim.fn.expand('%:t')

  if vim.fn.filereadable(file_dir .. "/Pipfile") == 1 then
    if file_dir ~= curr_dir then
      vim.cmd("w | !cd %:p:h && pipenv run python3 %:t")
    else
      vim.cmd("w | !pipenv run python3 %")
    end
  else
    vim.cmd("w | !python3 %")
  end
end

-- Save and run Python file for Python buffers only
vim.cmd([[
  autocmd FileType python nnoremap <buffer> <Leader>r :lua RunPython()
  ]])
