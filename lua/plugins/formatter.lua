return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- 🧼 Laravel Pint for PHP & Blade
        null_ls.builtins.formatting.pint.with({
          command = "./vendor/bin/pint", -- use project Pint
          filetypes = { "php", "blade" },
        }),

        -- 💅 Prettier for JS/TS/Vue
        null_ls.builtins.formatting.prettier.with({
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
          extra_args = {
            "--print-width", "100",
            "--single-quote", "true",
            "--jsx-single-quote", "true",
            "--semi", "false",
            "--trailing-comma", "all",
          },
        }),
      },
      on_attach = function(client, bufnr)
        -- manual format keymap
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, { buffer = bufnr, desc = "Format file" })
      end,
    })
  end,
}

