local M = {}

local theme_file = vim.fn.stdpath("config") .. "/theme"

function M.get()
  local f = io.open(theme_file, "r")
  if f then
    local theme = f:read("*a"):gsub("%s+$", "")
    f:close()
    return theme
  end
  return nil
end

function M.set(theme)
  local f = io.open(theme_file, "w")
  if f then
    f:write(theme)
    f:close()
  end
  vim.cmd.colorscheme(theme)
end

M.default = "tokyonight"

return M
