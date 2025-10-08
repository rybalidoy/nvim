local blink = require("blink.cmp")
local lspconfig = require("lspconfig")

return {
  cmd = { "phpactor", "language-server" },
  filetypes = { "php", "blade" },
  root_dir = function(fname)
    local root = lspconfig.util.root_pattern("composer.json", ".git")(fname)
    return root or vim.fn.getcwd()
  end
  capabilities = blink.get_lsp_capabilities(),
}
