return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },
    { "Bilal2453/luvit-meta", lazy = true },
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "markdownlint",
        "ruff",
        "lua_ls",
      },
      auto_update = true,
      run_on_start = true
    })
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("mason-lspconfig").setup({
      function(server_name)
        vim.lsp.config(server_name, {
          capabilities = capabilities,
        })
      end,
    })
    require("lazydev").setup()
  end,
}

