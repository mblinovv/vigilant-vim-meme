return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        go = { "gofmt", lsp_format = "fallback" },
        rust = { "rustfmt", lsp_format = "fallback" },
        zig = { "zigfmt", lsp_format = "fallback" },
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
