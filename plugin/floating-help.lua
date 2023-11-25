vim.api.nvim_create_user_command(
  'H',
  function(opts)
    require('floating-help').createFloatingHelp(opts)
  end,
  {
    nargs = 1,
    complete = 'help'
  }
)
