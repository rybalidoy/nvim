local ok, blink = pcall(require, "blink.cmp")

local function get_typescript_sdk()
  local local_sdk = vim.fn.getcwd() .. '/node_modules/typescript/lib'
  if vim.fn.isdirectory(local_sdk) == 1 then
    return local_sdk
  end

  local global_root = vim.fn.system('npm root -g'):gsub('\n', ''):gsub('\r', '')
  local global_sdk = global_root .. '/../typescript/lib'
  if vim.fn.isdirectory(global_sdk) == 1 then
    return global_sdk
  end

  return nil
end

return {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_dir = require('lspconfig.util').root_pattern("package.json", "tsconfig.json", ".git"),
  init_options = {
    typescript = get_typescript_sdk() and {
      tsdk = get_typescript_sdk(),
    } or nil,
  },
  settings = {
    vue = {
      complete = {
        tags = true,
        attributes = true,
      },
      -- important for <script setup lang="ts">
      hybridMode = false,
    },
  },
  capabilities = ok and blink.get_lsp_capabilities() or nil,
}

