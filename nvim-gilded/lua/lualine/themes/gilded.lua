local palette = {
	base      = "#19160f",
	surface   = "#201c14",
	overlay   = "#28241a",
	subtle    = "#706858",
	text      = "#f0e8d8",
	silver    = "#c8be9c",
	gold      = "#c8a038",
	champagne = "#e8782a",
	jade      = "#28b870",
	crimson   = "#d02848",
	sapphire  = "#4888d8",
	blush     = "#d07888",
}

return {
	normal = {
		a = { fg = palette.base, bg = palette.champagne, gui = "bold" },
		b = { fg = palette.silver, bg = palette.overlay },
		c = { fg = palette.subtle, bg = palette.surface },
	},
	insert = {
		a = { fg = palette.base, bg = palette.jade, gui = "bold" },
		b = { fg = palette.silver, bg = palette.overlay },
		c = { fg = palette.subtle, bg = palette.surface },
	},
	visual = {
		a = { fg = palette.base, bg = palette.blush, gui = "bold" },
		b = { fg = palette.silver, bg = palette.overlay },
		c = { fg = palette.subtle, bg = palette.surface },
	},
	replace = {
		a = { fg = palette.base, bg = palette.crimson, gui = "bold" },
		b = { fg = palette.silver, bg = palette.overlay },
		c = { fg = palette.subtle, bg = palette.surface },
	},
	command = {
		a = { fg = palette.base, bg = palette.gold, gui = "bold" },
		b = { fg = palette.silver, bg = palette.overlay },
		c = { fg = palette.subtle, bg = palette.surface },
	},
	inactive = {
		a = { fg = palette.subtle, bg = palette.surface },
		b = { fg = palette.subtle, bg = palette.surface },
		c = { fg = palette.subtle, bg = palette.surface },
	},
}
