return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local function os_icon()
			local icons = {
				macos = "",
				linux = "",
				windows = "",
			}

			if vim.fn.has("mac") == 1 then
				return icons.macos
			elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
				return icons.windows
			elseif vim.fn.has("unix") == 1 then
				return icons.linux
			else
				return ""
			end
		end

		lualine.setup({
			options = {
				disabled_filetypes = { "neo-tree" }, -- Disable lualine for nvim-tree
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
					},
					{ "encoding" },
					{ os_icon },
					{ "filetype" },
				},
			},
		})
	end,
}
