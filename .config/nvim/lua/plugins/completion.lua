local add = MiniDeps.add

add({
    source = 'saghen/blink.cmp',
    depends = {
        'rafamadriz/friendly-snippets',
        'saghen/blink.lib',
    },
})

vim.g.blink_cmp_disable_build_warning = true

local ok, blink = pcall(require, 'blink.cmp')
if not ok then return end

blink.setup({
    keymap = {
        preset = 'default',
        ['<Tab>']   = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<CR>']    = { 'accept', 'fallback' },
    },

    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        },
        menu = {
            border = 'rounded',
        },
    },
})
