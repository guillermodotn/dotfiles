return {
	{
		dir = "~/.config/nvim/gilded",
		name = "gilded",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("gilded")
		end,
	},
}
