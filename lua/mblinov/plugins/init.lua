return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	-- {
	-- 	"mskelton/termicons.nvim",
	-- 	requires = { "nvim-tree/nvim-web-devicons" },
	-- 	build = false,
	-- 	config = function()
	-- 		require("termicons").setup()
	-- 	end,
	-- },
}
