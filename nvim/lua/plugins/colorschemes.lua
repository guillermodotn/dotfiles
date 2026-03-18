return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				styles = {
					comments = { italic = false }, -- No italics in comments
				},
			})
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},
}
