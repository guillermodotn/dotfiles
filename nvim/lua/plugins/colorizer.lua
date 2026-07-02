-- Inline color preview for hex codes (#ff0000 shows actual color in the buffer)
return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		vim.o.termguicolors = true
		require("colorizer").setup()
	end,
}
