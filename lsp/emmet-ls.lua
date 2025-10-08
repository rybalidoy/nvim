local blink = require("blink.cmp")

return {
  cmd = { "emmet-ls", "--stdio" },
  filetypes = {
    "html",
    "css",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "svelte",
    "blade",
    "php",
  },
  root_markers = { ".git", "package.json" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    blink.get_lsp_capabilities()
  ),
}

