vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set

map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save and exit' } )
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Exit' } )
map('n', '<leader>Q', '<cmd>qa<cr>', { desc = 'Exit all' } )

map('n', '<C-h>', '<C-w>h', { desc = 'Split left'} )
map('n', '<C-j>', '<C-w>j', { desc = 'Split bellow'} )
map('n', '<C-k>', '<C-w>k', { desc = 'Split above'} )
map('n', '<C-l>', '<C-w>l', { desc = 'Split right'} )

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' } )
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' } )

map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' } )
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' } )
