local add = MiniDeps.add

add('neovim/nvim-lspconfig')
add('williamboman/mason.nvim')
add('williamboman/mason-lspconfig.nvim')
add('mfussenegger/nvim-jdtls')

local ok_mason, mason = pcall(require, 'mason')
if not ok_mason then return end

local ok_mlsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok_mlsp then return end

local ok_lsp, lspconfig = pcall(require, 'lspconfig')
if not ok_lsp then return end

mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        'basedpyright',
        'jdtls',
        'clangd',
        'lua_ls',
    },
    automatic_installation = true,
})

local on_attach = function(_, bufnr)
    local map = vim.keymap.set
    local opts = { buffer = bufnr }

    map('n', 'gd',         vim.lsp.buf.definition,      { buffer = bufnr, desc = 'Ir para definição' })
    map('n', 'gD',         vim.lsp.buf.declaration,     { buffer = bufnr, desc = 'Ir para declaração' })
    map('n', 'gr',         vim.lsp.buf.references,      { buffer = bufnr, desc = 'Referências' })
    map('n', 'gi',         vim.lsp.buf.implementation,  { buffer = bufnr, desc = 'Implementação' })
    map('n', 'K',          vim.lsp.buf.hover,           { buffer = bufnr, desc = 'Hover docs' })
    map('n', '<leader>rn', vim.lsp.buf.rename,          { buffer = bufnr, desc = 'Renomear' })
    map('n', '<leader>ca', vim.lsp.buf.code_action,     { buffer = bufnr, desc = 'Code action' })
    map('n', '<leader>d',  vim.diagnostic.open_float,   { buffer = bufnr, desc = 'Diagnóstico' })
    map('n', '[d',         vim.diagnostic.goto_prev,    { buffer = bufnr, desc = 'Diagnóstico anterior' })
    map('n', ']d',         vim.diagnostic.goto_next,    { buffer = bufnr, desc = 'Próximo diagnóstico' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.basedpyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim', 'MiniDeps', 'MiniFiles', 'MiniNotify', 'MiniBufremove' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
        },
    },
})
