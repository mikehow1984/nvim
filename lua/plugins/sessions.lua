return {
  "rmagatti/auto-session",
  dependencies = {
    'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
  },
  config = function ()
    require("auto-session").setup()
  end,
  opts = {
    auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wr', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
    { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },
}

