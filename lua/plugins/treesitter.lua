return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()

    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "vim", "javascript", "html", "csv", "gitcommit", "git_rebase", "gitignore", "go", "json", "make", "nginx", "python", "regex", "typescript", "yaml"},
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

