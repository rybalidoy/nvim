return {
  -- Core LSP engine
  { "neovim/nvim-lspconfig" },

  -- Mason (manages external tools)
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Mason bridge for LSPs
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
       automatic_installation = false,
      })
    end,
  },

  -- Optional formatter/linter integrations used in your statusline
  { "stevearc/conform.nvim", lazy = true },
  { "mfussenegger/nvim-lint", lazy = true },
}

