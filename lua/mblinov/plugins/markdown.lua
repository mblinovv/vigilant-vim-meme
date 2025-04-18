return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app; yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
	config = function()
		vim.keymap.set("n", "<leader>mdp", ":MarkdownPreview<CR>")
		vim.keymap.set("n", "<leader>mds", ":MarkdownPreviewStop<CR>")

		vim.g.mkdp_markdown_css = "/Users/michaelwilliams/dotfiles/.config/nvim/assets/md.css"
		vim.g.mkdp_highlight_css = "/Users/michaelwilliams/dotfiles/.config/nvim/assets/mdhl.css"
	end,
}
