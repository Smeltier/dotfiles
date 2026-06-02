local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('TextYankPost', {
  group = augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
  desc = 'Highlight ao copiar',
})

autocmd('BufWritePre', {
  group = augroup('trim_whitespace', { clear = true }),
  pattern = '*',
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
  desc = 'Remove espaços no final das linhas',
})

autocmd('BufReadPost', {
  group = augroup('last_position', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
  desc = 'Volta pra última posição no arquivo',
})

autocmd('FileType', {
  group = augroup('close_with_q', { clear = true }),
  pattern = { 'help', 'man', 'qf', 'notify' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf })
  end,
  desc = 'Fecha buffers utilitários com q',
})
