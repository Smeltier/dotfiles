local add = MiniDeps.add

add('ibhagwan/fzf-lua')

local ok, fzf = pcall(require, 'fzf-lua')
if not ok then return end

fzf.setup({
    winopts = {
        height = 0.85,
        width = 0.85,
        preview = {
            layout = 'vertical',
        },
    }
})

local map = vim.keymap.set

map('n', '<leader>ff', '<cmd>lua require("fzf-lua").files()<cr>',                  { desc = 'Buscar arquivo' })
map('n', '<leader>fg', '<cmd>lua require("fzf-lua").live_grep()<cr>',              { desc = 'Buscar texto no projeto' })
map('n', '<leader>fb', '<cmd>lua require("fzf-lua").buffers()<cr>',               { desc = 'Buscar buffer' })
map('n', '<leader>fc', '<cmd>lua require("fzf-lua").git_commits()<cr>',           { desc = 'Buscar commits' })
map('n', '<leader>fs', '<cmd>lua require("fzf-lua").lsp_document_symbols()<cr>',  { desc = 'Símbolos do arquivo' })
map('n', '<leader>fS', '<cmd>lua require("fzf-lua").lsp_workspace_symbols()<cr>', { desc = 'Símbolos do projeto' })
map('n', '<leader>fd', '<cmd>lua require("fzf-lua").diagnostics_document()<cr>',  { desc = 'Diagnósticos' })
