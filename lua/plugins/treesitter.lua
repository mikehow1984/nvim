return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("util.globals")
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = Languages,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
