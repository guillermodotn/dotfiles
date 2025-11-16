return {
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	{
		"folke/tokyonight.nvim",
		alt = {

			styles = {
				comments = { italic = false }, -- Disable italics in comments
			},
		},
		priority = 1000, -- Make sure to load this before all the other start plugins.
	},
	{
		"guillermodotn/nvim-earthsong",
		priority = 1000,
		alt = {

			styles = {
				comments = { italic = false }, -- Disable italics in comments
			},
		},
		init = function()
			vim.cmd.colorscheme("earthsong")
		end,
	},
}
