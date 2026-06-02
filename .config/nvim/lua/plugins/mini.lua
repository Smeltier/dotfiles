local add = MiniDeps.add

require('mini.icons').setup()

require('mini.statusline').setup({
    use_icons = true,
})

require('mini.files').setup({
    windows = {
        preview = true,
        width_preview = 50,
    },
})

require('mini.tabline').setup()

require('mini.move').setup({
    mappings = {
        left       = '<M-h>',
        right      = '<M-r>',
        down       = '<M-j>',
        up         = '<M-k>',
        line_left  = '<M-h>',
        line_right = '<M-r>',
        line_down  = '<M-j>',
        line_up    = '<M-k>',
    },
})

require('mini.surround').setup()
require('mini.comment').setup()
require('mini.pairs').setup()
require('mini.bufremove').setup()

require('mini.indentscope').setup({
    symbol = '|',
})

require('mini.notify').setup()
vim.notify = MiniNotify.make_notify()

local map = vim.keymap.set

map('n', '<leader>e', '<cmd>lua MiniFiles.open()<cr>',   { desc = 'File explorer' })
map('n', '<leader>bd', '<cmd>lua MiniBufremove.delete()<cr>', { desc = 'Close buffer' })
