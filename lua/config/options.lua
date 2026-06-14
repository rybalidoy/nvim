-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.root_spec = { "cwd" }

vim.g.dbs = {
  { name = "Local Postgres", url = "postgresql://postgres:ryan1234@localhost:5432/postgres" },
  { name = "evpay_test", url = "postgresql://postgres:ryan1234@localhost:5432/evpay_test" },
}
