-- lua/core/theme.lua

local theme_state_file = vim.fn.stdpath("data") .. "/theme_state.txt"

local M = {}

-- 🌈 Main function to set or toggle theme
function M.Theme(theme, mode)
  -- defaults
  theme = theme or "catppuccin"
  mode = mode or "dark"

  -- set background
  if mode == "light" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end

  -- apply the theme
  if theme == "catppuccin" then
    require("catppuccin").setup({
      flavour = mode == "light" and "latte" or "mocha",
      transparent_background = true,
      integrations = { cmp = true, treesitter = true, telescope = true },
    })
    vim.cmd.colorscheme("catppuccin")
  elseif theme == "tokyonight" then
    vim.cmd.colorscheme("tokyonight")
  elseif theme == "rose-pine" then
    vim.cmd.colorscheme("rose-pine")
  elseif theme == "gruvbox-material" then
    vim.cmd.colorscheme("gruvbox-material")
  elseif theme == "everforest" then
    vim.cmd.colorscheme("everforest")
  else
    vim.cmd.colorscheme(theme)
  end

  -- transparency (optional)
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- persist theme + mode
  local f = io.open(theme_state_file, "w")
  if f then
    f:write(theme .. ":" .. mode)
    f:close()
  end

  print("🎨 Theme set to " .. theme .. " (" .. mode .. ")")
end

-- 🧠 Restore on startup
function M.RestoreTheme()
  local f = io.open(theme_state_file, "r")
  if f then
    local data = f:read("*l")
    f:close()
    if data then
      local parts = vim.split(data, ":")
      local theme = parts[1] or "catppuccin"
      local mode = parts[2] or "dark"
      M.Theme(theme, mode)
      return
    end
  end
  M.Theme("catppuccin", "dark") -- default fallback
end

return M

