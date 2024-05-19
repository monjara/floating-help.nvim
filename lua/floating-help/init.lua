local M = {}

M.createFloatingHelp = function(q)
  local lines = vim.o.lines - vim.o.cmdheight
  local columns = vim.o.columns
  local height = lines
  local width = columns
  local row = lines
  local col = columns

  local opts = {
    height = height,
    width = width,
    row = row,
    col = col,
    relative = 'editor',
    style = 'minimal',
    zindex = 45,
  }

  local win_id = 0
  local status, result = pcall(function()
    local bufnr = vim.api.nvim_create_buf(false, true)
    win_id = vim.api.nvim_open_win(bufnr, true, opts)
    vim.opt_local.filetype = 'help'
    vim.opt_local.buftype = 'help'
    vim.api.nvim_command('help ' .. q['args'])

    vim.keymap.set('n', 'q', '<cmd>q<cr>', { noremap = true, buffer = bufnr })
    vim.keymap.set('n', '<esc>', '<cmd>q<cr>', { noremap = true, buffer = bufnr })
  end)
  if not status then
    vim.api.nvim_win_close(win_id, true)
    return
  end
  return result
end

return M
