return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function get_active_lsp()
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
      if #clients == 0 then
        return "No LSP"
      end
      local names = {}
      for _, client in pairs(clients) do
        table.insert(names, client.name)
      end
      return "  " .. table.concat(names, ", ")
    end

    local function get_formatters()
      local ok, conform = pcall(require, "conform")
      if not ok then
        return ""
      end
      local formatters = conform.list_formatters(0)
      local names = {}
      for _, f in ipairs(formatters) do
        table.insert(names, f.name)
      end
      return next(names) and "󰉼 " .. table.concat(names, ", ") or ""
    end

    local function get_linters()
      local ok, lint = pcall(require, "lint")
      if not ok then
        return ""
      end
      local linters = lint.linters_by_ft[vim.bo.filetype] or {}
      return next(linters) and " " .. table.concat(linters, ", ") or ""
    end

    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = {
          get_active_lsp,
          get_formatters,
          get_linters,
          "encoding",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
