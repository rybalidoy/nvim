return {
  -- Override the formatter to use postgres dialect
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.default_format_opts = opts.default_format_opts or {}
      opts.default_format_opts.timeout_ms = 3000 -- Give sqlfluff more time to format on save
      
      opts.formatters = opts.formatters or {}
      opts.formatters.sqlfluff = {
        args = { "format", "--dialect=postgres", "-" },
      }
    end,
  },

  -- Override the linter to use postgres dialect
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters = opts.linters or {}
      opts.linters.sqlfluff = {
        args = { "lint", "--format=json", "--dialect=postgres", "-" },
      }
    end,
  },
}
