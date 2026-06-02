local add = MiniDeps.add

add('lewis6991/gitsigns.nvim')

local ok, gitsigns = pcall(require, 'gitsigns')
if not ok then return end

gitsigns.setup({
    signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '' },
        topdelete    = { text = '' },
        changedelete = { text = '▎' },
        untracked    = { text = '▎' },
    },

    on_attach = function(bufnr)
        local map = vim.keymap.set


        map('n', ']h', gitsigns.next_hunk,  { buffer = bufnr, desc = 'Próximo hunk' })
        map('n', '[h', gitsigns.prev_hunk,  { buffer = bufnr, desc = 'Hunk anterior' })

        map('n', '<leader>hs', gitsigns.stage_hunk,   { buffer = bufnr, desc = 'Stage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk,   { buffer = bufnr, desc = 'Reset hunk' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { buffer = bufnr, desc = 'Undo stage hunk' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { buffer = bufnr, desc = 'Preview hunk' })
        map('n', '<leader>hb', gitsigns.blame_line,   { buffer = bufnr, desc = 'Blame linha' })
    end,
})
