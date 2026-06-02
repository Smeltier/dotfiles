local add = MiniDeps.add

add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = {
        post_checkout = function()
            vim.cmd('TSUpdate')
        end,
    },
})

local ok, configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

configs.setup({
    ensure_installed = {
        'lua',
        'python',
        'java',
        'cpp',
        'c',
        'markdown',
        'markdown_inline',
        'bash',
        'json',
        'yaml',
        'toml',
    },

    highlight = {
        enable = true,
    },

    indent = {
        enable = true,
    },
})
