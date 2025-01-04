return {
         -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
             "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            {
              "L3MON4D3/LuaSnip",
              -- follow latest release.
              version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            },
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = function()
          local cmp = require('cmp')
          local luasnip = require("luasnip")
          local lspkind = require("lspkind")
          
          -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
          require("luasnip.loaders.from_vscode").lazy_load()

 cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp"},
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
        end
      },
        --LSP
    -- {
    --     'neovim/nvim-lspconfig',
    --      cmd = 'LspInfo',
    --      event = {'BufReadPre', 'BufNewFile'},
    --      dependencies = {
    --         {'hrsh7th/cmp-nvim-lsp'},
    --      },
    --      init = function()
    --       -- Reserve a space in the gutter
    --       -- This will avoid an annoying layout shift in the screen
    --       vim.opt.signcolumn = 'yes'
    --      end,
    --      config = function()
    --         local lspconfig_defaults = require('lspconfig').util.default_config
    --
    --         lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    --           'force',
    --           lspconfig_defaults.capabilities,
    --           require('cmp_nvim_lsp').default_capabilities()
    --         )
    --
    --         -- This is where you enable features that only work
    --         -- if there is a language server active in the file
    --         vim.api.nvim_create_autocmd('LspAttach', {
    --           desc = 'LSP actions',
    --           callback = function(event)
    --             local opts = {buffer = event.buf}
    --
    --             vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    --             vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    --             vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    --             vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    --             vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    --             vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    --             vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    --             vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    --             vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    --             vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    --           end,
    --         })
    --
    --         require('lspconfig').lua_ls.setup({})
    --         require('lspconfig').gopls.setup({})
    --         require('lspconfig').golangci_lint_ls.setup({})
    --         require('lspconfig').zls.setup({})
    --         require('lspconfig').rust_analyzer.setup({})
    --         require('lspconfig').sqls.setup({})
    --         require('lspconfig').biome.setup({})
    --         require('lspconfig').eslint.setup({})
    --         require('lspconfig').htmx.setup({})
    --         require('lspconfig').dockerls.setup({})
    --         require('lspconfig').docker_compose_language_server.setup({})
    --         require('lspconfig').helm_ls.setup({})
    --         require('lspconfig').tsserver.setup({})
    --      end,
    -- },
}
