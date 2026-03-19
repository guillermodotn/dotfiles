local M = {}

---@class Options
M.options = {
	variant = "auto",
	dark_variant = "main",
	dim_inactive_windows = false,
	extend_background_behind_borders = true,

	enable = {
		terminal = true,
		legacy_highlights = true,
		migrations = true,
	},

	styles = {
		bold = true,
		italic = true,
		transparency = false,
	},

	groups = {
		border = "subtle",
		link = "sapphire",
		panel = "surface",

		error = "crimson",
		hint = "jade",
		info = "sapphire",
		note = "silver",
		ok = "jade",
		warn = "gold",
		todo = "champagne",

		git_add = "jade",
		git_change = "gold",
		git_delete = "crimson",
		git_dirty = "gold",
		git_ignore = "muted",
		git_merge = "sapphire",
		git_rename = "blush",
		git_stage = "jade",
		git_text = "gold",
		git_untracked = "subtle",

		h1 = "champagne",
		h2 = "gold",
		h3 = "blush",
		h4 = "jade",
		h5 = "sapphire",
		h6 = "subtle",
	},

	highlight_groups = {},
	palette = {},

	before_highlight = function(group, highlight, palette) end,
}

---@param options Options
function M.extend_options(options)
	M.options = vim.tbl_deep_extend("force", M.options, options or {})

	if M.options.variant == "auto" then
		if vim.o.background == "light" then
			M.options.variant = "light"
		else
			M.options.variant = M.options.dark_variant or "main"
		end
	end
end

return M
