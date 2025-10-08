vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>ct", function()
  local themes = {
    "rose-pine",
    "tokyonight",
    "catppuccin",
    "gruvbox-material",
    "everforest",
  }

  vim.ui.select(themes, { prompt = "Select a colorscheme:" }, function(choice)
    if choice then
      ColorMyPencils(choice)
    end
  end)
end, { desc = "Change Theme" })
