return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false, -- load immediately
    priority = 1000, -- make sure it loads before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "latte", -- latte (light), mocha (dark)
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          nvimtree = true,
          telescope = true,
          mini = { enabled = true },
        },
      })

      -- Apply colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}

