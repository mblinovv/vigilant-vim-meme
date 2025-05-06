return {
	{
		"blazkowolf/gruber-darker.nvim",
		opts = {
			bold = false,
		},
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{
		"tjdevries/colorbuddy.nvim",
	},
	{
		"gmr458/cold.nvim",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon",
				extend_background_behind_borders = true,
				styles = {
					transparency = true,
					bold = false,
					italic = false,
				},
				highlight_groups = {
					TelescopeBorder = { fg = "highlight_high", bg = "none" },
					TelescopeNormal = { bg = "none" },
					TelescopePromptNormal = { bg = "base" },
					TelescopeResultsNormal = { fg = "subtle", bg = "none" },
					TelescopeSelection = { fg = "text", bg = "base" },
					TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
					AlphaHeader = { fg = "rose", bg = "none" },
					AlphaButtons = { fg = "iris", bg = "none" },
					AlphaShortcut = { fg = "rose", bg = "none" },
					AlphaFooter = { fg = "gold", bg = "none" },
				},
			})

			-- vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
				style = {
					boolean = "none",
					number = "none",
					float = "none",
					error = "none",
					comments = "none",
					conditionals = "none",
					functions = "none",
					headings = "bold",
					operators = "none",
					strings = "none",
					variables = "none",

					keywords = "none",
					keyword_return = "none",
					keywords_loop = "none",
					keywords_label = "none",
					keywords_exception = "none",

					builtin_constants = "none",
					builtin_functions = "none",
					builtin_types = "none",
					builtin_variables = "none",
				},
				colors = {
					func = "#bc96b0",
					keyword = "#787bab",
					-- string = "#d4bd98",
					string = "#8a739a",
					-- string = "#f2e6ff",
					-- number = "#f2e6ff",
					-- string = "#d8d5b1",
					number = "#8f729e",
					-- type = "#dcaed7",
				},
			})
		end,
	},
	{
		"jnurmine/Zenburn",
		config = function()
			vim.g.zenbones_italic_comments = true -- only Comment remains italic
			vim.g.zenwritten = { transparent_background = true }
			vim.g.zenbones = { transparent_background = true }

			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "zenbones",
				callback = function()
					local no_italic = {
						"Constant",
						"SpecialKey",
						"Conceal",
						"Italic",
						"Statement",
						"Underlined",
						"Todo",
						"Type",
						"Identifier",
					}
					for _, grp in ipairs(no_italic) do
						-- remove all GUI and cterm styling
						vim.cmd("highlight " .. grp .. " gui=NONE cterm=NONE")
					end
				end,
			})
			vim.cmd.colorscheme("zenbones")
		end,
	},
	{
		"RRethy/base16-nvim",
	},
	{
		"ramojus/mellifluous.nvim",
		name = "mellifluous",
		priority = 1000,
		config = function()
			require("mellifluous").setup({
				mellifluous = {
					neutral = true,
				},
				colorset = "mellifluous",
				transparent_background = {
					enabled = true,
				},
				styles = {
					comments = { italic = true },
				},
			})

			-- vim.cmd.colorscheme("mellifluous")
		end,
	},
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local kanagawa = require("kanagawa-paper")
			kanagawa.setup({
				transparent = true,
			})
			-- vim.cmd.colorscheme("kanagawa-paper")
		end,
	},
}
