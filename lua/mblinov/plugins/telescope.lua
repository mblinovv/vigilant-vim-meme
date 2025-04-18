return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			-- local transform_mod = require("telescope.actions.mt").transform_mod

			-- local trouble = require("trouble")
			-- local trouble_telescope = require("trouble.sources.telescope")

			-- or create your custom action
			-- local custom_actions = transform_mod({
			-- 	open_trouble_qflist = function(prompt_bufnr)
			-- 		trouble.toggle("quickfix")
			-- 	end,
			-- })

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							-- ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
							-- ["<C-t>"] = trouble_telescope.open,
						},
					},
				},
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
					find_files = {
						hidden = true,
						find_command = {
							"rg",
							"--files",
							"--glob",
							"!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}",
							"--path-separator",
							"/",
						},
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("zoxide")
			local builtin = require("telescope.builtin")

			vim.keymap.set(
				"n",
				"<leader><leader>",
				"<cmd>Telescope find_files<cr>",
				{ desc = "Fuzzy find files in cwd" }
			)
			vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			vim.keymap.set(
				"n",
				"<leader>fs",
				"<cmd>Telescope grep_string<cr>",
				{ desc = "Find string under cursor in cwd" }
			)
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
			vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<cr>", {})
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
			vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>ws", builtin.lsp_workspace_symbols, {})
			vim.keymap.set("n", "<leader>fz", ":Telescope zoxide list<CR>", {})
			vim.keymap.set("n", "<leader>fv", builtin.help_tags, {})
		end,
	},
	{
		"jvgrootveld/telescope-zoxide",
		config = function() end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
