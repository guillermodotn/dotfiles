return {
	"FotiadisM/tabset.nvim",
	lazy = false,
	config = function()
		require("tabset").setup({
			defaults = {
				tabwidth = 4,
				expandtab = true,
			},
			languages = {
				go = {
					tabwidth = 4,
					expandtab = false,
				},
				make = {
					tabwidth = 8,
					expandtab = false,
				},
				{
					filetypes = { "javascript", "jq", "json", "yaml", "yaml.ansible", "sshconfig" },
					config = {
						tabwidth = 2,
					},
				},
			},
		})
	end,
}
