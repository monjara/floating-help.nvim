vim.api.nvim_create_user_command('H', function(opts)
  require('full-help').createFullHelp(opts)
end, {
  nargs = 1,
  complete = 'help',
})
