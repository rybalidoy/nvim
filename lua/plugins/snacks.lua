local function find_env_files()
  Snacks.picker.files({
    hidden = true,
    pattern = ".env*",
    search = ".env*",
    title = "Env Files",
  })
end

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = { hidden = true },
        explorer = { hidden = true, ignored = true },
      },
    },
  },
  keys = {
    {
      "<leader>fE",
      find_env_files,
      desc = "Find Env Files",
    },
  },
}
