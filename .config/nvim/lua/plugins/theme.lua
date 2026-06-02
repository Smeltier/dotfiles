local add = MiniDeps.add

add('rebelot/kanagawa.nvim')

local ok, kanagawa = pcall(require, 'kanagawa')
if not ok then return end

kanagawa.setup({
    theme = 'wave',
    -- transparent = true,
    background = {
        dark = 'wave',
    },
})

vim.cmd('colorscheme kanagawa-wave')
