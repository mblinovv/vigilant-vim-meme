return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { 
        "c",
        "lua",
        "vim",
        "go",
        "gotmpl",
        "templ",
        "rust",
        "zig",
        "typescript",
        "javascript",
        "python",
        "helm",
        "dockerfile",
        "regex",
        "sql",
        "tsx",
        "terraform",
        "yaml",
      },

      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
      },
    })

    vim.filetype.add({
      extension = {
        gotmpl = 'gotmpl',
      },
      pattern = {
        [".*/templates/.*%.tpl"] = "helm",
        [".*/templates/.*%.ya?ml"] = "helm",
        ["helmfile.*%.ya?ml"] = "helm",
      },
    })

    vim.filetype.add({
      extension = {
          templ = "templ",
      },
    })
  end,
}
