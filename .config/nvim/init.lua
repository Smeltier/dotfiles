vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.uv.fs_stat(mini_path) then
	vim.cmd('echo "Installing mini.nvim..." | redraw')
	vim.fn.system({
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.nvim', mini_path
	})
	vim.cmd('packadd mini.nvim | helptags ALL')
end

require('mini.deps').setup({ path = { package = path_package } })

local add = MiniDeps.add

require('config.options')
require('config.keymaps')
require('config.autocmds')

require('plugins.theme')
require('plugins.mini')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.completion')
require('plugins.conform')
require('plugins.ai')
require('plugins.jdtls')
require('plugins.gitsigns')
require('plugins.fzf')
require('plugins.neotest')
