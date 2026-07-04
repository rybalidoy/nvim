local theme = require("config.theme")
local persisted = theme.get()

local augroup = vim.api.nvim_create_augroup("ThemePersist", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
  group = augroup,
  callback = function()
    local name = vim.g.colors_name
    if name and name ~= "" then
      local f = io.open(vim.fn.stdpath("config") .. "/theme", "w")
      if f then
        f:write(name)
        f:close()
      end
    end
  end,
})

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = persisted or theme.default,
    },
    keys = {
      {
        "<leader>tt",
        function()
          local current = vim.g.colors_name or theme.default
          local theme_list = vim.fn.getcompletion("", "colorscheme")
          local idx
          for i, t in ipairs(theme_list) do
            if t == current then
              idx = i
              break
            end
          end
          local next = theme_list[(idx or 0) % #theme_list + 1]
          vim.cmd.colorscheme(next)
          vim.notify("Theme: " .. next)
        end,
        desc = "Toggle theme",
      },
      {
        "<leader>ts",
        function()
          local theme_list = vim.fn.getcompletion("", "colorscheme")
          vim.ui.select(theme_list, {
            prompt = "Select theme:",
          }, function(choice)
            if choice then
              vim.cmd.colorscheme(choice)
              vim.notify("Theme: " .. choice)
            end
          end)
        end,
        desc = "Select theme",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      table.insert(opts.spec, { "<leader>t", group = "Theme" })
    end,
  },
}
