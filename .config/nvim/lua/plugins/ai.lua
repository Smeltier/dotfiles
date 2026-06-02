local add = MiniDeps.add

add('zbirenbaum/copilot.lua')

local ok, copilot = pcall(require, 'copilot')
if not ok then return end

copilot.setup({
    suggestion = {
        enabled = true,
        auto_trigger = false,
        keymap = {
            accept      = '<C-l>',
            accept_word = '<C-Right>',
            next        = '<M-]>',
            prev        = '<M-[>',
            dismiss     = '<C-e>',
        },
    },
    panel = {
        enabled = false,
    },
    filetypes = {
        markdown = true,
        help     = false,
    },
})

vim.keymap.set('n', '<leader>at', function()
    require('copilot.suggestion').toggle_auto_trigger()
end, { desc = 'Toggle Copilot' })
