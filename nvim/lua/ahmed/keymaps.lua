local bind = vim.keymap.set
local tl = require('telescope.builtin')
-- Keymaps for telescope search
bind('n', '<C-p>', function() if not pcall(tl.git_files) then tl.find_files() end end)
bind('n', '<Leader>ff', tl.find_files, {})
bind('n', '<Leader>fs', function() tl.grep_string({ search = vim.fn.input('🔍> ') }) end)
bind('n', '<Leader>fg', tl.live_grep, {})
bind('n', '<Leader>fb', tl.buffers, {})
-- open file explorer
bind('n', '<Leader>e', vim.cmd.NvimTreeToggle)
-- toggle undo tree
bind('n', '<Leader>u', vim.cmd.UndotreeToggle)
-- buffer navigation
bind('n', '<Leader>bn', '<cmd>bn<cr>')
bind('n', '<Leader>bp', '<cmd>bp<cr>')
bind('n', '<Leader>q', '<cmd>bd<cr>')
-- yank to system clipboard
bind('n', '<Leader>y', '\"+y')
bind('n', '<Leader>Y', '\"+Y')
bind('v', '<Leader>y', '\"+y')
-- search-replace word under cursor
bind('n', '<Leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- comment
bind('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)')
-- navigate between windows/buffers  
bind('n', '<C-h>', '<C-w>h')
bind('n', '<C-l>', '<C-w>l')
bind('n', '<C-j>', '<C-w>j')
bind('n', '<C-k>', '<C-w>k')
bind('n', '<C-Right>', ':vertical res +1^M<CR>')
bind('n', '<C-Left>', ':vertical res -1^M<CR>')
-- save/quit
bind('n', '<C-s>', '<Esc><cmd>w<CR>')
bind('i', '<C-s>', '<Esc><cmd>w<CR>')
bind('n', '<C-q>', '<cmd>q<cr>')
-- Shift line up or down
bind('n', '<A-j>', '<cmd>m+1<cr>')
bind('n', '<A-k>', '<cmd>m-2<cr>')
bind('v', '<A-j>', ":m'>+1<cr>gv=gv")
bind('v', '<A-k>', ":m'<-2<cr>gv=gv")
bind('n', '<A-J>', 'Yp')
bind('n', '<A-K>', 'YP')
-- better J keep cursor in the spot
bind('n', '<A-h>', 'mzJ`z')
bind('n', '<A-l>', 'mzJ`z')
-- Navigate through wrapped lines
bind('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
bind('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- Indent with Shift
bind('n', '<S-Tab>', 'v<')
bind('n', '<Tab>', 'v>')
-- yank full line
bind('n', 'Y', 'VY')
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
