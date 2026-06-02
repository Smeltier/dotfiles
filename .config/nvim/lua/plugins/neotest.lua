local add = MiniDeps.add

add({
    source = 'nvim-neotest/neotest',
    depends = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'antoinemadec/FixCursorHold.nvim',
        'nvim-treesitter/nvim-treesitter',
        'rcasia/neotest-java',
    },
})

local ok, neotest = pcall(require, 'neotest')
if not ok then return end

neotest.setup({
    log_level = vim.log.levels.WARN,
    notification = {
        enabled = false,
    },
    adapters = {
        require('neotest-java'),
    },
})

local map = vim.keymap.set

map('n', '<leader>tr', '<cmd>lua require("neotest").run.run()<cr>',                { desc = 'Run test' })
map('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', { desc = 'Run test file' })
map('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle()<cr>',         { desc = 'Toggle test summary' })
map('n', '<leader>to', '<cmd>lua require("neotest").output.open()<cr>',            { desc = 'Show test output' })
