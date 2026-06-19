return {
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			vim.o.termguicolors = true
			require("colorizer").setup()
		end,
	},
}
