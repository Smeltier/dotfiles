local ok, jdtls = pcall(require, 'jdtls')
if not ok then return end

local home = os.getenv('HOME')
local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
local java_path = '/opt/homebrew/opt/openjdk@21/bin/java'

local workspace_dir = home .. '/.cache/jdtls/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    cmd = {
        java_path,
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', jdtls_path .. '/config_mac_arm',
        '-data', workspace_dir,
    },

    root_dir = vim.fs.dirname(vim.fs.find({
        'pom.xml',
        'build.gradle',
        '.git',
    }, { upward = true })[1]),

    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = 'JavaSE-21',
                        path = '/opt/homebrew/opt/openjdk@21',
                        default = true,
                    },
                },
            },
        },
    },

    on_attach = function(_, bufnr)
        local map = vim.keymap.set
        map('n', 'gd',         vim.lsp.buf.definition,     { buffer = bufnr, desc = 'Ir para definição' })
        map('n', 'gD',         vim.lsp.buf.declaration,    { buffer = bufnr, desc = 'Ir para declaração' })
        map('n', 'gr',         vim.lsp.buf.references,     { buffer = bufnr, desc = 'Referências' })
        map('n', 'gi',         vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Implementação' })
        map('n', 'K',          vim.lsp.buf.hover,          { buffer = bufnr, desc = 'Hover docs' })
        map('n', '<leader>rn', vim.lsp.buf.rename,         { buffer = bufnr, desc = 'Renomear' })
        map('n', '<leader>ca', vim.lsp.buf.code_action,    { buffer = bufnr, desc = 'Code action' })
        map('n', '<leader>d',  vim.diagnostic.open_float,  { buffer = bufnr, desc = 'Diagnóstico' })
        map('n', '[d',         vim.diagnostic.goto_prev,   { buffer = bufnr, desc = 'Diagnóstico anterior' })
        map('n', ']d',         vim.diagnostic.goto_next,   { buffer = bufnr, desc = 'Próximo diagnóstico' })
    end,
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'java',
    callback = function()
        jdtls.start_or_attach(config)
    end,
})
