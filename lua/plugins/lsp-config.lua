return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = Lsps,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      local lspconfig = require("lspconfig")
      local language_servers = Lsps
      for _, ls in ipairs(language_servers) do
        local settings = {}
        if ls == 'lua_ls' then
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  "vim",
                },
              },
            },
          }
        end
        lspconfig[ls].setup({
          capabilities = capabilities,
          settings = settings,
        })
      end
    end,
  },
}
