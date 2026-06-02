local add = MiniDeps.add

add('stevearc/conform.nvim')

local ok, conform = pcall(require, 'conform')
if not ok then return end

conform.setup({
  formatters_by_ft = {
    python = { 'ruff_format' },
    java   = { 'google-java-format' },
    cpp    = { 'clang_format' },
    c      = { 'clang_format' },
    lua    = { 'stylua' },
  },
})

vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
  conform.format({ async = true, lsp_fallback = true })
end, { desc = 'Formatar arquivo' })
