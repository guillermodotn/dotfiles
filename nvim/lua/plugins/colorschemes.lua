return {
	{
		"guillermodotn/nvim-earthsong",
		name = "earthsong",
		priority = 1000,
		config = function()
			require("earthsong").setup()
			vim.cmd.colorscheme("earthsong")
		end,
	},
}
